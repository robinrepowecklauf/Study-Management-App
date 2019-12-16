import 'package:flutter/material.dart';
import 'package:todo_management_app/components/base_appbar.dart';
import 'package:todo_management_app/model/subject.dart';
import 'package:todo_management_app/resources/values/app_colors.dart';
import 'package:todo_management_app/resources/values/styles.dart';

class TaskPage extends StatefulWidget {
  final Subject subject;
  String radioValue = 'First';

  TaskPage({Key key, @required this.subject}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(33, 33, 33, 100),
      appBar: BaseAppBar(
        titleText: widget.subject.titleText,
        subTitleText: '',
        color: widget.subject.color,
        leftIconButton: IconButton(
          icon: Icon(Icons.expand_more),
          iconSize: 35,
          color: Palette.LIGHT_BLUE_COLOR,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        rightIconButtons: <Widget>[
          IconButton(
              icon: const Icon(Icons.add_circle),
              iconSize: 35,
              color: Palette.LIGHT_BLUE_COLOR,
              onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.more_vert),
            iconSize: 35,
            color: Palette.LIGHT_BLUE_COLOR,
            onPressed: () {
              // TODO turns 90 degree and opens up new menu
            },
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: <Widget>[
              Card(
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: RadioListTile(
                    groupValue: 's',
                    onChanged: (value) {},
                    value: 'null',
                    title: Text('Heading out'),
                    subtitle: Text('yoyoy'),
                  )),
              Card(
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: RadioListTile(
                    groupValue: 's',
                    onChanged: (value) {},
                    value: 'null',
                    title: Text('Heading out'),
                    subtitle: Text('yoyoy'),
                  )),
              Text(
                widget.subject.aboutText,
                style: aboutTextStyle,
              ),
            ],
          )),
    );
  }
}
