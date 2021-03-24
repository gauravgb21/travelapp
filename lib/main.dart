import 'package:flutter/material.dart';

import './screens/homepage.dart';
import './screens/hotel_search.dart';
import './screens/flights_search.dart';
import './screens/hotel_details.dart';
import './screens/date_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'homepage',
      routes: {
        '/': (context) => HomePage(),
        '/hotelsearch': (context) => HotelSearch(),
        '/flightsearch': (context) => FlightSearch(),
        '/hoteldetails': (context) => HotelDetails(),
        '/datepicker': (context) => DatePickerScreen()
      },
    );
  }
}
