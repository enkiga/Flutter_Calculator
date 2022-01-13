import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color fillColor;
  final Color textColor;
  final double textSize;
  final Function callback;

  const CalcButton(
      {Key? key,
      required this.text,
      required this.fillColor,
      required this.textColor,
      required this.textSize,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0) ,
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(fillColor ),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: textSize,
                color: textColor
          ),
        ),
      )),
    );
  }
}
