import 'package:flutter/material.dart';

MaterialButton squaree() {
  Color? color;
  void Function()? onpressed;
  String? text;
  return MaterialButton(
    onPressed: onpressed,
    color: color,
    child: Text(text!),
    height: 400,
  );
}
