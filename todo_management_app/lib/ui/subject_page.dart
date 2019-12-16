import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_management_app/model/task.dart';
import 'package:todo_management_app/resources/values/app_colors.dart';
import 'package:todo_management_app/components/base_appbar.dart';
import 'package:todo_management_app/model/subject.dart';
import 'package:todo_management_app/components/labeled_radio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_management_app/resources/values/styles.dart';

class SubjectPage extends StatefulWidget {
  final Subject subject;
  String radioValue = 'First';

  SubjectPage({Key key, @required this.subject}) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage>
    with TickerProviderStateMixin {
  int value;
  int currentIndex = 0;
  bool isSelected;
  List<String> titles = ['Uncompleted', 'Completed'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: widget.subject.color,
        canvasColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(33, 33, 33, 100),
          appBar: BaseAppBar(
            titleText: widget.subject.titleText,
            color: widget.subject.color,
            subTitleText: '',
            leftIconButton: IconButton(
              icon: Icon(Icons.expand_more),
              iconSize: 35,
              color: widget.subject.color,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            rightIconButtons: <Widget>[
              IconButton(
                  icon: const Icon(Icons.add_circle),
                  iconSize: 35,
                  color: widget.subject.color,
                  onPressed: () {
                    setState(() {
                      widget.subject.tasks.add(Task());
                    });
                  }),
              IconButton(
                icon: const Icon(Icons.more_vert),
                iconSize: 35,
                color: widget.subject.color,
                onPressed: () {
                  // TODO turns 90 degree and opens up new menu
                },
              )
            ],
          ),
          body: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx > 0) {
                setState(() {
                  currentIndex = 0;
                });
              } else {
                setState(() {
                  currentIndex = 1;
                });
              }
            },
            child: Container(
                height: double.infinity,
                color: Colors.transparent,
                child: Stack(children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(widget.subject.aboutText,
                            style: aboutTextStyle),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setHeight(130)),
                      child: Row(children: _buildTypeOfTaskSelector())),
                  Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setHeight(220)),
                      child: _buildListView()),
                ])),
          )),
    );
  }

  Widget _buildListView() => ListView.separated(
        padding: EdgeInsets.all(8.0),
        separatorBuilder: (context, index) => Divider(
          color: Palette.DARK_MODE_LIGHT_GRAY_COLOR,
        ),
        itemCount: widget.subject.tasks.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onPanUpdate: (details) => print('ToDo...'),
          child: LabeledRadio(
            label: 'Walk the dog',
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            value: index,
            groupValue: value,
            subLabel: '25 Maj 2019',
            color: widget.subject.color,
            onChanged: (int newValue) {
              setState(() {
                value = newValue;
              });
            },
          ),
        ),
      );

  List<Widget> _buildTypeOfTaskSelector() {
    return titles.map((selected) {
      var index = titles.indexOf(selected);
      isSelected = currentIndex == index;
      return Padding(
        padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(100)),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              color: isSelected
                  ? widget.subject.color
                  : Palette.DARK_MODE_LIGHT_GRAY_COLOR,
              fontSize: isSelected ? 25 : 18,
              fontWeight: FontWeight.bold,
            ),
            child: Text(selected),
            duration: Duration(milliseconds: 150),
          ),
        ),
      );
    }).toList();
  }
}
