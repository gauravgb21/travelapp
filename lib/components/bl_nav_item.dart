import 'package:flutter/material.dart';

class BLNavItem extends StatelessWidget {
  IconButton iconButton = new IconButton(
      icon: Icon(Icons.flight), onPressed: () => {print("Button Pressed")});
  String btnName = '';

  BLNavItem(this.iconButton, this.btnName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.0,
      height: 100.0,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: BoxDecoration(
          color: Color(0xfff7f7f7),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconButton,
          Text(
            btnName,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(102, 102, 102, 1)),
          )
        ],
      ),
    );
  }
}
