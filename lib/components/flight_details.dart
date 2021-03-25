import 'package:flutter/material.dart';

class FlightDetails extends StatefulWidget {
  @override
  _FlightDetailsState createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  String _to = 'Mumbai', _from = 'New Delhi';
  String _departureDate = '-', _returnDate = '-';
  int _adultCount = 0, _childrenCount = 0, _infantCount = 0;
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

  void _navigateAndSetDateForFlight() async {
    print('Date Picker was called !!');
    dynamic result = await Navigator.pushNamed(context, '/datepicker');
    DateTime fDay = result['firstDate'], lDay = result['lastDate'];
    String newDate = fDay.day.toString() +
        ' ' +
        monthMap[fDay.month] +
        ' ' +
        weekDayMap[fDay.weekday] +
        ',' +
        fDay.year.toString();
    setState(() {
      if (dateType == 'DEPARTURE') {
        _departureDate = newDate;
      } else {
        _returnDate = newDate;
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
                    controller: TextEditingController(text: _to),
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
                    controller: TextEditingController(text: _from),
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
                          _navigateAndSetDateForFlight();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(74, 95, 149, 0.1),
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
                          _navigateAndSetDateForFlight();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(74, 95, 149, 0.1),
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
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 500,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 20.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.2),
                                            blurRadius: 5.0,
                                            spreadRadius: 2.0,
                                            offset: Offset(1.0, 1.0))
                                      ]),
                                  child: Text(
                                    'Traveller',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 20.0),
                                  child: Text(
                                    'ADD NUMBER OF TRAVELLERS',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0, bottom: 5.0),
                                            child: Text(
                                              'Adults',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              '12yrs & above on the day of travel',
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        width: 140.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.2),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 2.0,
                                                  offset: Offset(1.0, 1.0))
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 30.0,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (_adultCount != 0)
                                                      _adultCount =
                                                          _adultCount - 1;
                                                  });
                                                },
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ),
                                            Text(_adultCount.toString(),
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Container(
                                              width: 30.0,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _adultCount =
                                                        _adultCount + 1;
                                                  });
                                                },
                                                child: Text(
                                                  '+',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0, bottom: 5.0),
                                            child: Text(
                                              'Children',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              '2 - 12yrs on the day of travel',
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        width: 140.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.2),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 2.0,
                                                  offset: Offset(1.0, 1.0))
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 30.0,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (_childrenCount != 0)
                                                      _childrenCount =
                                                          _childrenCount - 1;
                                                  });
                                                },
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ),
                                            Text(_childrenCount.toString(),
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Container(
                                              width: 30.0,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _childrenCount =
                                                        _childrenCount + 1;
                                                  });
                                                },
                                                child: Text(
                                                  '+',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0, bottom: 5.0),
                                            child: Text(
                                              'Infants',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              'Under 2yrs on the day of travel',
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        width: 140.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.2),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 2.0,
                                                  offset: Offset(1.0, 1.0))
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 30.0,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (_infantCount != 0)
                                                      _infantCount =
                                                          _infantCount - 1;
                                                  });
                                                },
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ),
                                            Text(_infantCount.toString(),
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Container(
                                              width: 30.0,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _infantCount =
                                                        _infantCount + 1;
                                                  });
                                                },
                                                child: Text(
                                                  '+',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  margin: EdgeInsets.only(
                                      top: 60.0, left: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3.0)),
                                    color: Color.fromRGBO(8, 24, 101, 1),
                                  ),
                                  child: TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text(
                                      'DONE',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(74, 95, 149, 0.1),
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
                            '$_adultCount Adult, $_childrenCount Children, $_infantCount Infant',
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
                                Color.fromRGBO(8, 24, 101, 1))),
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
