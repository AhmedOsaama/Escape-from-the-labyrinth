// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? text;
  final double width;
  final double height;
  final IconData? icon;
  final selected;
  final fontSize;
  final onPressed;
  Button({this.selected = false,required this.width, this.text, required this.height, this.icon,this.onPressed,this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(11),
      // padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: selected ? Border.all(color: Colors.red) : null,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 51, 119, 199).withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 35,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
     child: RaisedButton(
              onPressed: onPressed,
              child: text != null
                  ? Text(
                      text!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: fontSize ?? 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontFamily: "Alegreya"),
                    )
                  : Text("....."),
              color: Color.fromARGB(255, 51, 119, 199),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              elevation: 0,
            ),
    );
  }
}
