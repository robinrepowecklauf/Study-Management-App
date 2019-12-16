import 'package:flutter/material.dart';
import 'package:todo_management_app/components/base_appbar.dart';
import 'package:todo_management_app/components/subject_card.dart';
import 'package:todo_management_app/components/observer/state_listener.dart';
import 'package:todo_management_app/components/observer/state_provider.dart';
import 'package:todo_management_app/components/animation/page_up_animation.dart';
import 'package:todo_management_app/components/animation/scale_animation.dart';
import 'package:todo_management_app/resources/values/app_colors.dart';
import 'package:todo_management_app/model/subject.dart';
import 'package:todo_management_app/ui/subject_page.dart';
import 'create_subject_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> implements StateListener {
  List<Subject> subjects = [];

  var stateProvider, createdSubject;

  @override
  void initState() {
    super.initState();
    stateProvider = new StateProvider();
    stateProvider.subscribe(this);
  }

  @override
  void onStateChanged(ObserverState state) {
    if (state == ObserverState.SUBJECT_CREATED && this.mounted) {
      subjects.add(createdSubject);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 33, 33, 100),
      appBar: BaseAppBar(
        titleText: 'E Hana',
        subTitleText: "Manage your daily tasks",
        rightIconButtons: <Widget>[
          IconButton(
              icon: const Icon(Icons.add_circle),
              iconSize: 35,
              color: Colors.white,
              onPressed: () {
                _navigateAndGetTask(context);
              }),
          IconButton(
            icon: const Icon(Icons.more_vert),
            iconSize: 35,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: _buildTaskList(),
    );
  }

  _navigateAndGetTask(BuildContext context) async {
    createdSubject = await Navigator.push(
      context,
      SlideUpRoute(page: CreateSubjectPage()),
    );

    if (createdSubject != null)
      stateProvider.notify(ObserverState.SUBJECT_CREATED);
  }

  Widget _buildTaskList() {
    return GridView.builder(
      padding: EdgeInsets.all(20),
      itemCount: subjects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      itemBuilder: (BuildContext context, int index) {
        if (index < subjects.length) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                ScaleRoute(
                  page: SubjectPage(subject: subjects.elementAt(index)),
                ),
              );
            },
            child: SubjectCard(
              gradientFromColor: subjects.elementAt(index).color.withAlpha(210),
              gradientToColor: subjects.elementAt(index).color,
              titleText: subjects.elementAt(index).titleText,
            ),
          );
        }
      },
    );
  }
}
