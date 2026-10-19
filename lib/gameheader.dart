import 'package:flutter/material.dart';
class gameHeader extends StatelessWidget {
  String text;

  gameHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),);
  }
}
