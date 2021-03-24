import 'package:flutter/material.dart';

class DatePickerFooter extends StatelessWidget {
  final String dateType;
  final String dateString;

  DatePickerFooter(this.dateType, this.dateString);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  this.dateType + ' ' + 'DATE',
                  style: TextStyle(color: Colors.black54, fontSize: 13.0),
                ),
                Text(
                  this.dateString,
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: 50.0,
            child: TextButton(
              child: Text(
                'CONTINUE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
