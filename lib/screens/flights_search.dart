import 'package:flutter/material.dart';

import '../components/flight_trip_type.dart';
import '../components/flight_details.dart';
import '../components/custom_bottomsheet.dart';

class FlightSearch extends StatefulWidget {
  @override
  _FlightSearchState createState() => _FlightSearchState();
}

class _FlightSearchState extends State<FlightSearch> {
  bool showCustomBottomSheet = false;
  int _adultCount = 0, _childrenCount = 0, _infantCount = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Flights',
              style: TextStyle(
                  color: Color.fromRGBO(8, 24, 101, 1),
                  fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 38.0,
                color: Color.fromRGBO(8, 24, 101, 1),
              ),
              splashRadius: 20.0,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 1.0,
            width: MediaQuery.of(context).size.width * 1.0,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                FlightTripType(),
                FlightDetails(showCustomBottomSheet, this._adultCount,
                    this._childrenCount, this._infantCount, () {
                  setState(() {
                    showCustomBottomSheet = true;
                  });
                }),
              ],
            ),
          ),
        ),
        if (showCustomBottomSheet)
          GestureDetector(
            onTap: () {
              setState(() {
                showCustomBottomSheet = false;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              color: Color.fromRGBO(0, 0, 0, 0.4),
            ),
          ),
        if (showCustomBottomSheet)
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: CustomBottomSheet(
                    this._adultCount, this._childrenCount, this._infantCount,
                    (int adultCount, int childrenCount, int infantCount) {
                  setState(() {
                    this._adultCount = adultCount;
                    this._childrenCount = childrenCount;
                    this._infantCount = infantCount;
                    this.showCustomBottomSheet = false;
                  });
                }),
              ))
      ],
    );
  }
}
