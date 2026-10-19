import 'package:flutter/material.dart';
typedef onPlayerClick = void Function(int);
class xoButton extends StatelessWidget {
String click;
int index;
onPlayerClick on_PlayerClick;
xoButton(this.click,this.index,this.on_PlayerClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      margin: EdgeInsets.all(2),
      child: ElevatedButton(onPressed: (){
        on_PlayerClick.call(index);
      }, child: Text(click,style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600),)),
    );
  }
}
