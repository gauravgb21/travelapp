import 'package:flutter/material.dart';

class FlightDetails extends StatefulWidget {
  @override
  _FlightDetailsState createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  String _to = 'Mumbai', _from = 'New Delhi';

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

  void _setDateForFlight() {
    print('Date Picker was called !!');
    Navigator.pushNamed(context, '/datepicker');
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
                        onTap: () => _setDateForFlight(),
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
                              Text('Fri, 27 Nov 2019',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _setDateForFlight(),
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
                              Text('Tue, 03 Dec 2019',
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
                Container(
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
                      Text('2 Adult, 1 Children, 0 Infant',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black))
                    ],
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
