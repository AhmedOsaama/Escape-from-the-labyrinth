// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData? icon;
  final selected;
  final color;
  final onPressed;
  MyIconButton({required this.width, required this.height, this.icon,this.onPressed, this.color, this.selected = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(11),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
          color: color ?? Color.fromARGB(255, 51, 119, 199),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 51, 119, 199).withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 35,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: icon != null
          ? IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed ?? (){},   // onPressed is onPressed function if it is not null. else: empty function.
        icon: Icon(icon),
        color: Colors.white,
      ) : selected ? MyIconButton(width: 5.0, height: 5.0,color: Colors.white,) : IconButton(onPressed: onPressed ?? (){},icon: Icon(null),)
    );
  }
}
