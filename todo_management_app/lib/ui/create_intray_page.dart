import 'package:flutter/material.dart';
import 'package:todo_management_app/components/base_appbar.dart';
import 'package:todo_management_app/model/task.dart';
import '../resources/values/app_colors.dart';
import 'package:todo_management_app/components/observer/state_provider.dart';
import 'package:flutter/cupertino.dart';

class InTray extends StatefulWidget {
  InTray({Key key}) : super(key: key);

  @override
  InTrayState createState() => InTrayState();
}

class InTrayState extends State<InTray> {
  StateProvider _stateProvider = StateProvider();
  final titleTextController = TextEditingController();
  final aboutTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      titleTextController.dispose();
      aboutTextController.dispose();

      super.dispose();
    }

    return Scaffold(
        appBar: BaseAppBar(
          titleText: 'Create in tray',
          subTitleText: "Ease your mind.",
          icons: <Widget>[
            IconButton(
                icon: const Icon(Icons.check),
                iconSize: 35,
                color: Palette.PRIMARY_COLOR_OPTION_BLUE,
                onPressed: () {
                  if (titleTextController.text.length > 0) {
                    Navigator.pop(
                        context,
                        Task(
                            title: titleTextController.text,
                            about: aboutTextController.text));
                  }
                })
          ],
          iconButton: IconButton(
            icon: Icon(Icons.arrow_downward),
            iconSize: 35,
            color: Palette.PRIMARY_COLOR_OPTION_BLUE,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                      color: Palette.PRIMARY_COLOR_LIGHT_GRAY,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                      child: Column(children: <Widget>[
                        titleTextField,
                        SizedBox(
                          height: 15,
                        ),
                        Container(height: 70, child: aboutTextField),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 90,
                              color: Colors.green),
                        ),
                      ]),
                    ),
                  ]))),
        ));
  }

  CupertinoTextField get titleTextField => CupertinoTextField(
        autofocus: true,
        cursorColor: Palette.PRIMARY_COLOR_OPTION_BLUE,
        placeholder: 'Name your task..',
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Palette.PRIMARY_COLOR_DARK_GRAY),
        maxLines: 1,
        maxLength: 15,
        maxLengthEnforced: true,
        controller: titleTextController,
        textInputAction: TextInputAction.continueAction,
      );

  CupertinoTextField get aboutTextField => CupertinoTextField(
        autofocus: true,
        cursorColor: Palette.PRIMARY_COLOR_OPTION_BLUE,
        placeholder: 'About..',
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Palette.PRIMARY_COLOR_DARK_GRAY),
        controller: aboutTextController,
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical(y: -1.0),
        maxLength: 50,
        maxLines: 2,
        maxLengthEnforced: true,
      );
}
