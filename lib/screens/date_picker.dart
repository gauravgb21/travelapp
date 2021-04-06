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
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 18.0),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 38.0,
            color: Theme.of(context).primaryColor,
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
                    fontSize: 18.0, color: Theme.of(context).primaryColor),
              ))
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: CustomDatePicker(
          _controller,
          isRangePicker: args['showRangePicker'],
          selectedDayBgColor: Theme.of(context).primaryColor,
          inBetweenBgColor: Color(0xffffece9),
          onDateSelect: (DateTime fDay, DateTime lDay) =>
              handleRangeSelection(fDay, lDay),
        ),
      ),
    );
  }
}
