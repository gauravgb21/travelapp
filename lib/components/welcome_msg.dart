import 'package:flutter/material.dart';

class WelcomeMsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(255, 102, 75, 0.7),
                Color.fromRGBO(255, 102, 75, 1)
              ]),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome aboard!',
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
                "We'll help you find the best experiences & adventures. So enjoy your journey.",
                style: TextStyle(fontSize: 13.0, color: Colors.white70)),
          )
        ],
      ),
    );
  }
}
