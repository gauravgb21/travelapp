import 'package:flutter/material.dart';

import '../components/flight_trip_type.dart';
import '../components/flight_details.dart';

class FlightSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: [FlightTripType(), FlightDetails()],
        ),
      ),
    );
  }
}
