import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabeledRadio extends StatelessWidget {
  final String label;
  final String subLabel;
  final EdgeInsets padding;
  final int groupValue;
  final int value;
  final Function onChanged;
  final Color color;
  final bool isSelected;

  const LabeledRadio(
      {this.label,
      this.subLabel,
      this.padding,
      this.groupValue,
      this.value,
      this.onChanged,
      this.color,
      this.isSelected});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<int>(
              groupValue: groupValue,
              activeColor: color,
              focusColor: color,
              hoverColor: color,
              value: value,
              onChanged: (int newValue) {
                onChanged(newValue);
              },
            ),
            SizedBox(
              width: ScreenUtil.getInstance().setWidth(20),
            ),
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(label,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                SizedBox(height: ScreenUtil.getInstance().setHeight(20)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(subLabel,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
