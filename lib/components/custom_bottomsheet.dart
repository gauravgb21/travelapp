import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final int adultCount, childrenCount, infantCount;
  final Function onSave;

  CustomBottomSheet(
      this.adultCount, this.childrenCount, this.infantCount, this.onSave);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  int _adultCount, _childrenCount, _infantCount;

  AnimationController _controller;
  Animation<Offset> _animation;

  void initState() {
    super.initState();
    this._adultCount = widget.adultCount;
    this._childrenCount = widget.childrenCount;
    this._infantCount = widget.infantCount;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        height: 500,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                        child: Text(
                          'Adults',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                    height: 45.0,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1.0, 1.0))
                    ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (_adultCount != 0)
                                  _adultCount = _adultCount - 1;
                              });
                            },
                            child: Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.black54),
                            ),
                          ),
                        ),
                        Text(_adultCount.toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        Container(
                          width: 30.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _adultCount = _adultCount + 1;
                              });
                            },
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.black54),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                        child: Text(
                          'Children',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                    height: 45.0,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1.0, 1.0))
                    ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (_childrenCount != 0)
                                  _childrenCount = _childrenCount - 1;
                              });
                            },
                            child: Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.black54),
                            ),
                          ),
                        ),
                        Text(_childrenCount.toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        Container(
                          width: 30.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _childrenCount = _childrenCount + 1;
                              });
                            },
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.black54),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                        child: Text(
                          'Infants',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                    height: 45.0,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1.0, 1.0))
                    ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (_infantCount != 0)
                                  _infantCount = _infantCount - 1;
                              });
                            },
                            child: Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.black54),
                            ),
                          ),
                        ),
                        Text(_infantCount.toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        Container(
                          width: 30.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _infantCount = _infantCount + 1;
                              });
                            },
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.black54),
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
              width: MediaQuery.of(context).size.width * 1.0,
              height: 50.0,
              margin: EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
                color: Theme.of(context).primaryColor,
              ),
              child: TextButton(
                onPressed: () {
                  widget.onSave(
                      this._adultCount, this._childrenCount, this._infantCount);
                },
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
      ),
    );
  }
}
