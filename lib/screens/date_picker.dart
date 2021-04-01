// import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
//     show CalendarCarousel;
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/classes/event_list.dart';
// import 'package:intl/intl.dart' show DateFormat;

// import '../components/date_picker_footer.dart';

// class DatePickerScreen extends StatefulWidget {
//   @override
//   _DatePickerScreenState createState() => _DatePickerScreenState();
// }

// class _DatePickerScreenState extends State<DatePickerScreen> {
//   DateTime _currentDate = DateTime(2019, 2, 3);
//   DateTime _currentDate2 = DateTime(2019, 2, 3);
//   String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
//   DateTime _targetDateTime = DateTime(2019, 2, 3);
//   DateTime _currCal =
//       DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

//   static Widget _eventIcon = new Container(
//     decoration: new BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(1000)),
//         border: Border.all(color: Colors.blue, width: 2.0)),
//     child: new Icon(
//       Icons.person,
//       color: Colors.amber,
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           'Select Departure Date',
//           style: TextStyle(color: Color.fromRGBO(8, 24, 101, 1)),
//         ),
//         elevation: 2,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(
//             Icons.keyboard_arrow_left,
//             size: 38.0,
//             color: Color.fromRGBO(8, 24, 101, 1),
//           ),
//           splashRadius: 20.0,
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Container(
//           color: Colors.white,
//           margin: EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CalendarCarousel<Event>(
//                   onDayPressed: (DateTime date, List<Event> events) {
//                     this.setState(() => _currentDate = date);
//                   },
//                   weekendTextStyle: TextStyle(
//                     color: Color.fromRGBO(255, 102, 75, 1),
//                   ),
//                   thisMonthDayBorderColor: Colors.grey.shade300,
//                   headerTitleTouchable: true,
//                   showHeaderButton: false,
//                   headerText: '${DateFormat.yMMMM().format(_currCal)}',
//                   headerTextStyle:
//                       TextStyle(color: Colors.black, fontSize: 20.0),
//                   showWeekDays: false,
//                   weekFormat: false,
//                   height: 430.0,
//                   selectedDateTime: _currentDate,
//                   daysHaveCircularBorder: false,
//                   minSelectedDate: _currentDate.subtract(Duration(days: 360)),
//                   maxSelectedDate: _currentDate.add(Duration(days: 360)),
//                   showOnlyCurrentMonthDate: true,
//                   selectedDayButtonColor: Color.fromRGBO(255, 102, 75, 1),
//                   selectedDayBorderColor: Color.fromRGBO(255, 102, 75, 1),
//                   headerMargin: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
//                   iconColor: Colors.black,
//                   onCalendarChanged: (date) {
//                     setState(() {
//                       _currCal = DateTime(date.year, date.month, date.day);
//                     });
//                   }

//                   /// null for not rendering any border, true for circular border, false for rectangular border
//                   ),
//               DatePickerFooter(
//                   'DEPARTURE', DateFormat.yMMMd().format(_currentDate))
//             ],
//           )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../components/custom_date_picker.dart';

class DatePickerScreen extends StatefulWidget {
  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime firstDate;
  DateTime lastDate;

  void handleRangeSelection(DateTime fDay, DateTime lDay) {
    print('Here goes all the handling');
    print(fDay);
    print(lDay);
    setState(() {
      firstDate = fDay;
      lastDate = lDay;
    });
  }

  CustomDatePickerController _controller =
      new CustomDatePickerController(windowSize: 2);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Departure Date',
          style:
              TextStyle(color: Color.fromRGBO(8, 24, 101, 1), fontSize: 18.0),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 38.0,
            color: Color.fromRGBO(8, 24, 101, 1),
          ),
          splashRadius: 20.0,
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
              onPressed: () {
                print('I should be sending this back :: $firstDate $lastDate');
                Map<String, DateTime> mp = new Map();
                mp['firstDate'] = firstDate;
                mp['lastDate'] = lastDate;
                Navigator.pop(context, mp);
              },
              child: Text(
                'Save',
                style: TextStyle(
                    fontSize: 18.0, color: Color.fromRGBO(8, 24, 101, 1)),
              ))
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: CustomDatePicker(
          _controller,
          isRangePicker: args['showRangePicker'],
          selectedDayBgColor: Color.fromRGBO(8, 24, 101, 1),
          inBetweenBgColor: Color.fromRGBO(8, 24, 101, 0.1),
          onDateSelect: (DateTime fDay, DateTime lDay) =>
              handleRangeSelection(fDay, lDay),
        ),
      ),
    );
  }
}
