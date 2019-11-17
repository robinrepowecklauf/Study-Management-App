import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyManager',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to StudyManager'),
        ),
        body: Center(
          child: Text('Time to study'),
        ),
      ),
    );
  }
}
