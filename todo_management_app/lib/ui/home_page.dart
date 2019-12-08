import 'package:flutter/material.dart';
import 'package:todo_management_app/components/base_appbar.dart';
import 'package:todo_management_app/components/intray_card.dart';
import 'package:todo_management_app/components/observer/state_listener.dart';
import 'package:todo_management_app/components/observer/state_provider.dart';
import 'package:todo_management_app/components/page_up_animation.dart';
import 'package:todo_management_app/resources/values/app_colors.dart';
import 'package:todo_management_app/model/task.dart';
import 'create_intray_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> implements StateListener {
  var stateProvider = new StateProvider();
  var result;

  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    stateProvider.subscribe(this);
  }

  @override
  void onStateChanged(ObserverState state) {
    if (state == ObserverState.UPDATE_LIST) {
      tasks.add(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        titleText: 'Hello, Robin',
        subTitleText: "Let's get more organized",
        icons: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              iconSize: 35,
              color: Palette.PRIMARY_COLOR_OPTION_BLUE,
              onPressed: () {
                _navigateAndGetTask(context);
              }),
          IconButton(
            icon: const Icon(Icons.more_vert),
            iconSize: 35,
            color: Palette.PRIMARY_COLOR_OPTION_BLUE,
            onPressed: () {},
          )
        ],
      ),
      body: buildTaskList(),
    );
  }

  _navigateAndGetTask(BuildContext context) async {
    result = await Navigator.push(
      context,
      SlideUpRoute(page: InTray()),
    );

    if (result != null) stateProvider.notify(ObserverState.UPDATE_LIST);
  }

  Widget buildTaskList() {
    return GridView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index < tasks.length) {
          return GestureDetector(
            onTap: () {
              print(tasks.elementAt(index).title);
              print(tasks.elementAt(index).about);
            },
            child: InTrayCard(
              fromColor: Palette.PRIMARY_COLOR_LIGHT_BLUE,
              toColor: Palette.SECONDARY_COLOR_LIGHT_BLUE,
              title: tasks.elementAt(index).title,
            ),
          );
        }
      },
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: tasks.length,
    );
  }
}
