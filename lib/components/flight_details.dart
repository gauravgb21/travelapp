import 'package:flutter/material.dart';

class FlightDetails extends StatefulWidget {
  final bool showCustomBottomSheet;
  final int _adultCount, _childrenCount, _infantCount;
  Function onOpen;
  FlightDetails(this.showCustomBottomSheet, this._adultCount,
      this._childrenCount, this._infantCount, this.onOpen);
  @override
  _FlightDetailsState createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  String _to = 'Mumbai', _from = 'New Delhi';
  String _departureDate = '-', _returnDate = '-', _bookingDate = '-';
  String dateType = 'DEPARTURE';
  Map<int, String> weekDayMap = {
    1: 'Mon',
    2: 'Tue',
    3: 'Wed',
    4: 'Thu',
    5: 'Fri',
    6: 'Sat',
    7: 'Sun'
  };

  Map<int, String> monthMap = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec'
  };

  bool showBottomSheet = false;

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  handleSwap() {
    setState(() {
      String tmp = _to;
      _to = _from;
      _from = tmp;
    });
  }

  void _navigateAndSetDateForFlight(bool showRangePicker) async {
    print('Date Picker was called !!');
    dynamic result = await Navigator.pushNamed(context, '/datepicker',
        arguments: {'showRangePicker': showRangePicker});
    DateTime fDay = result['firstDate'], lDay = result['lastDate'];
    String newDate = fDay.day.toString() +
        ' ' +
        monthMap[fDay.month] +
        ' ' +
        weekDayMap[fDay.weekday] +
        ',' +
        fDay.year.toString();
    String newLDate = lDay.day.toString() +
        ' ' +
        monthMap[lDay.month] +
        ' ' +
        weekDayMap[lDay.weekday] +
        ',' +
        lDay.year.toString();
    setState(() {
      if (showRangePicker) {
        _departureDate = newDate;
        _returnDate = newLDate;
      } else {
        _bookingDate = newDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Text(
                    'From',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: TextEditingController(text: _from),
                    onChanged: (String data) {
                      print('Date is :: $data');
                      _from = data;
                    },
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Text(
                    'To',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: TextEditingController(text: _to),
                    onChanged: (String data) {
                      _to = data;
                    },
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            dateType = 'DEPARTURE';
                          });
                          _navigateAndSetDateForFlight(true);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xfff7f7f7),
                              border: Border.all(
                                  width: 1.0, color: Color(0xffe7e7e7)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          width:
                              (MediaQuery.of(context).size.width - 40) * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text('DEPARTURE',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54)),
                              ),
                              Text(this._departureDate,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            dateType = 'RETURN';
                          });
                          _navigateAndSetDateForFlight(true);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xfff7f7f7),
                              border: Border.all(
                                  width: 1.0, color: Color(0xffe7e7e7)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          width:
                              (MediaQuery.of(context).size.width - 40) * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text('RETURN',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54)),
                              ),
                              Text(this._returnDate,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _navigateAndSetDateForFlight(false);
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xfff7f7f7),
                        border:
                            Border.all(width: 1.0, color: Color(0xffe7e7e7)),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text('BOOKING DATE',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54)),
                        ),
                        Text(this._bookingDate,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black))
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => widget.onOpen(),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xfff7f7f7),
                        border:
                            Border.all(width: 1.0, color: Color(0xffe7e7e7)),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text('TRAVELLER',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54)),
                        ),
                        Text(
                            widget._adultCount.toString() +
                                ' Adult, ' +
                                widget._childrenCount.toString() +
                                ' Children, ' +
                                widget._infantCount.toString() +
                                ' Infant',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 82,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextButton(
                  child: Icon(
                    Icons.swap_vert,
                    size: 40.0,
                    color: Colors.black,
                  ),
                  onPressed: handleSwap,
                ),
              ),
            ),
          ],
        ));
  }
}
