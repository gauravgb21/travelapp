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
        color: Color.fromRGBO(74, 95, 149, 0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 40) * 0.33,
            child: TextButton(
              child: Text(
                'Round Trip',
                style: TextStyle(
                    color: selectedBtn == 'RT' ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: selectedBtn == 'RT'
                      ? Color.fromRGBO(8, 24, 101, 1)
                      : Colors.transparent,
                  padding: EdgeInsets.all(12)),
              onPressed: () => handleBtnClick('RT'),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 40) * 0.33,
            child: TextButton(
              child: Text(
                'One Way',
                style: TextStyle(
                    color: selectedBtn == 'OW' ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: selectedBtn == 'OW'
                      ? Color.fromRGBO(8, 24, 101, 1)
                      : Colors.transparent,
                  padding: EdgeInsets.all(12)),
              onPressed: () => handleBtnClick('OW'),
            ),
          ),
          Container(
              width: (MediaQuery.of(context).size.width - 40) * 0.33,
              child: TextButton(
                child: Text(
                  'Multi City',
                  style: TextStyle(
                      color: selectedBtn == 'MC' ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: selectedBtn == 'MC'
                        ? Color.fromRGBO(8, 24, 101, 1)
                        : Colors.transparent,
                    padding: EdgeInsets.all(12)),
                onPressed: () => handleBtnClick('MC'),
              ))
        ],
      ),
    );
  }
}
