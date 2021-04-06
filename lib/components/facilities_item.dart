import 'package:flutter/material.dart';

class FacilitiesItem extends StatelessWidget {
  IconButton iconButton = new IconButton(icon: Icon(Icons.flight));

  FacilitiesItem(this.iconButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: BoxDecoration(
          color: Color(0xfff7f7f7),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: iconButton,
    );
  }
}
