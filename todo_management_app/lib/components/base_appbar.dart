import 'package:flutter/material.dart';
import 'package:todo_management_app/resources/values/styles.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final String subTitleText;
  final List<Widget> icons;
  final Widget iconButton;

  const BaseAppBar(
      {Key key, this.iconButton, this.titleText, this.subTitleText, this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        // TODO make this set in this class
        actions: icons,
        bottom: bottom,
        // TODO make this set in this class
        leading: iconButton);
  }

  @override
  Size get preferredSize => new Size.fromHeight(130);

  /* Widget setBackButton(BuildContext context) => new IconButton(
        icon: Icon(Icons.arrow_downward),
        iconSize: 35,
        color: Palette.PRIMARY_COLOR_OPTION_BLUE,
        onPressed: () {
          Navigator.pop(context);
        },
      ); */

  /*  Widget setIconActionButton(BuildContext context) => new IconButton(
        icon: Icon(Icons.arrow_downward),
        iconSize: 35,
        color: Palette.PRIMARY_COLOR_OPTION_BLUE,
        onPressed: () {
          Navigator.pop(context);
        },
      ); */

  PreferredSize get bottom => new PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: Container(
          height: 80,
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(titleText, style: title),
              Text(subTitleText, style: subTitle)
            ],
          ),
        ),
      );
}
