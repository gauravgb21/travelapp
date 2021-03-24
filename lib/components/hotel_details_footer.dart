import 'package:flutter/material.dart';

class HotelDetailsFooter extends StatelessWidget {
  final String price;

  HotelDetailsFooter(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 30.0,
            child: Row(
              children: [
                Text(
                  '\$' + this.price,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Material(
                  child: Text(
                    '/ night',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 50.0,
            child: TextButton(
              child: Text(
                'Check Availability',
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(8, 24, 101, 1)),
            ),
          )
        ],
      ),
    );
  }
}
