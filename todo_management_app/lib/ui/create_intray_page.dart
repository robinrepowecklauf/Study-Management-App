import 'package:flutter/material.dart';
import '../resources/values/app_colors.dart';

class InTray extends StatefulWidget {
  @override
  _InTrayState createState() => _InTrayState();
}

class _InTrayState extends State<InTray> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_downward),
            iconSize: 35,
            color: Palette.PRIMARY_COLOR_OPTION_BLUE,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(child: Text('yoyo')),
    );
  }
}

/* IconButton(
          icon: Icon(Icons.arrow_downward),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    curve: Curves.linearToEaseOut,
                    type: PageTransitionType.upToDown,
                    child: HomePage()));
          },
        ), */
