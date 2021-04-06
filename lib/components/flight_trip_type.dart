import 'package:flutter/material.dart';

class FlightTripType extends StatefulWidget {
  @override
  _FlightTripTypeState createState() => _FlightTripTypeState();
}

class _FlightTripTypeState extends State<FlightTripType> {
  String selectedBtn = 'RT';

  void handleBtnClick(btnName) {
    setState(() {
      selectedBtn = btnName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xfff7f7f7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 40) * 0.33,
            height: 45.0,
            child: TextButton(
              child: Text(
                'Round Trip',
                style: TextStyle(
                    color: selectedBtn == 'RT' ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: selectedBtn == 'RT'
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  padding: EdgeInsets.all(12)),
              onPressed: () => handleBtnClick('RT'),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 40) * 0.33,
            height: 45.0,
            child: TextButton(
              child: Text(
                'One Way',
                style: TextStyle(
                    color: selectedBtn == 'OW' ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: selectedBtn == 'OW'
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  padding: EdgeInsets.all(12)),
              onPressed: () => handleBtnClick('OW'),
            ),
          ),
          Container(
              width: (MediaQuery.of(context).size.width - 40) * 0.33,
              height: 45.0,
              child: TextButton(
                child: Text(
                  'Multi City',
                  style: TextStyle(
                      color: selectedBtn == 'MC' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: selectedBtn == 'MC'
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    padding: EdgeInsets.all(12)),
                onPressed: () => handleBtnClick('MC'),
              ))
        ],
      ),
    );
  }
}
