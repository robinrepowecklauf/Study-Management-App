import 'package:flutter/material.dart';
import 'package:todo_management_app/resources/values/styles.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final String subTitleText;
  final List<Widget> rightIconButtons;
  final Widget leftIconButton;
  final Color color;

  BaseAppBar(
      {Key key,
      this.leftIconButton,
      this.titleText,
      this.subTitleText,
      this.color,
      this.rightIconButtons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        //brightness: Brightness.light,
        backgroundColor: Color.fromRGBO(33, 33, 33, 0),
        // TODO make this set in this class
        actions: rightIconButtons,
        bottom: bottom(this.color),
        // TODO make this set in this class
        leading: leftIconButton);
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

  PreferredSize bottom(Color color) => PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: Container(
          height: 80,
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(this.titleText, style: appBarTitleText(color)),
                  SizedBox(width: 15),
                ],
              ),
              Text(this.subTitleText, style: appBarSubTitleText)
            ],
          ),
        ),
      );
}
