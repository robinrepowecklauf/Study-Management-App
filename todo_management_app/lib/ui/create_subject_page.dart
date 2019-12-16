import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:custom_radio/custom_radio.dart';
import 'package:todo_management_app/components/base_appbar.dart';
import 'package:todo_management_app/resources/values/styles.dart';
import 'package:todo_management_app/resources/values/app_colors.dart';
import 'package:todo_management_app/model/subject.dart';

class CreateSubjectPage extends StatefulWidget {
  CreateSubjectPage({Key key, this.title}) : super(key: key);

  final String title;
  String radioValue = '';

  @override
  CreateSubjectPageState createState() => CreateSubjectPageState();
}

class CreateSubjectPageState extends State<CreateSubjectPage> {
  Palette palette;
  Color pickedColor;
  var titleTextController, aboutTextController;

  @override
  void initState() {
    super.initState();
    palette = Palette();
    titleTextController = TextEditingController();
    aboutTextController = TextEditingController();
  }

  @override
  void dispose() {
    titleTextController.dispose();
    aboutTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(33, 33, 33, 100),
        appBar: BaseAppBar(
          titleText: 'Create task',
          subTitleText: "Be more productive",
          rightIconButtons: <Widget>[
            IconButton(
                icon: const Icon(Icons.check_circle),
                iconSize: 35,
                color: Colors.white,
                onPressed: () {
                  if (titleTextController.text.length > 0 &&
                      this.pickedColor != null) {
                    Navigator.pop(
                        context,
                        Subject(
                            titleText: titleTextController.text,
                            aboutText: aboutTextController.text,
                            color: this.pickedColor));
                    this.pickedColor = null;
                  }
                }),
          ],
          leftIconButton: IconButton(
            icon: Icon(Icons.expand_more),
            iconSize: 35,
            color: Colors.white,
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
                height: 400,
                decoration: BoxDecoration(
                    color: Palette.DARK_MODE_DARK_GRAY_COLOR,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Column(
                      children: <Widget>[
                        titleTextField,
                        SizedBox(
                          height: 15,
                        ),
                        Container(height: 70, child: aboutTextField),
                        Container(
                          height: 230,
                          child: GridView.count(
                            crossAxisCount: 4,
                            children:
                                List.generate(palette.colors.length, (index) {
                              for (int i = 0; i < palette.colors.length; i++) {
                                return coloredCircle(index.toString(),
                                    palette.colors.elementAt(index), 75);
                              }
                            }),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              )),
        ));
  }

  Container coloredCircle(String s, Color color, double size) => Container(
        width: size,
        height: size,
        child: CustomRadio<String, double>(
            value: s,
            groupValue: widget.radioValue,
            duration: Duration(milliseconds: 50),
            animsBuilder: (AnimationController controller) =>
                [CurvedAnimation(parent: controller, curve: Curves.easeInOut)],
            builder: (BuildContext context, List<double> animValues,
                Function updateState, String value) {
              final alpha = (animValues[0] * 255).toInt();
              return GestureDetector(
                  onTap: () {
                    if (!mounted) return;
                    setState(() {
                      widget.radioValue = value;
                      this.pickedColor = color;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(32.0),
                    margin:
                        EdgeInsets.symmetric(horizontal: 2.0, vertical: 12.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color.withAlpha(alpha),
                        border: Border.all(
                          color: color,
                          width: 4.0,
                        )),
                  ));
            }),
      );

  CupertinoTextField get titleTextField => CupertinoTextField(
        autofocus: true,
        cursorColor: Palette.LIGHT_BLUE_COLOR,
        style: TextStyle(color: Colors.white),
        placeholder: 'Name your task..',
        placeholderStyle: placeholderDarkModeTextStyle,
        keyboardAppearance: Brightness.dark,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Palette.DARK_MODE_LIGHT_GRAY_COLOR),
        maxLines: 1,
        maxLength: 12,
        maxLengthEnforced: true,
        controller: titleTextController,
        textInputAction: TextInputAction.continueAction,
      );

  CupertinoTextField get aboutTextField => CupertinoTextField(
        autofocus: true,
        cursorColor: Palette.LIGHT_BLUE_COLOR,
        style: TextStyle(color: Colors.white),
        placeholder: 'About..',
        placeholderStyle: placeholderDarkModeTextStyle,
        keyboardAppearance: Brightness.dark,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Palette.DARK_MODE_LIGHT_GRAY_COLOR),
        controller: aboutTextController,
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical(y: -1.0),
        maxLength: 50,
        maxLines: 2,
        maxLengthEnforced: true,
      );
}
