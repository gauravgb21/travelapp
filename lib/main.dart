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
          primaryColor: Color(0xffff664b),
          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(
              fontSize: 32.0,
            ),
            bodyText2: TextStyle(fontSize: 14.0),
          )),
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
