import 'package:flutter/material.dart';
import 'package:todo_management_app/components/base_appbar.dart';
import '../resources/values/app_colors.dart';

class InTray extends StatefulWidget {
  @override
  _InTrayState createState() => _InTrayState();
}

class _InTrayState extends State<InTray> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        titleText: 'Create in tray',
        subTitleText: "Ease your mind.",
        icons: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            iconSize: 35,
            color: Palette.PRIMARY_COLOR_OPTION_BLUE,
            onPressed: () {},
          )
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
              color: Palette.PRIMARY_COLOR_LIGHT_GRAY,
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                // TODO change child to textfield and style it
                child: Container(
                  color: Colors.red,
                  height: 20,
                  width: 500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*IconButton(
        icon: navigateBackIcon,
        iconSize: 35,
        color: Palette.PRIMARY_COLOR_OPTION_BLUE,
        onPressed: () {
          Navigator.pop(context);
        },
      ) */
