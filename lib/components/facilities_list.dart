import 'package:flutter/material.dart';

import './facilities_item.dart';

class FacilitiesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FacilitiesItem(IconButton(
            icon: Icon(
              Icons.free_breakfast_outlined,
              color: Colors.black54,
              size: 32,
            ),
          )),
          FacilitiesItem(IconButton(
            icon: Icon(
              Icons.wifi,
              color: Colors.black54,
              size: 32,
            ),
          )),
          FacilitiesItem(IconButton(
            icon: Icon(
              Icons.single_bed_outlined,
              color: Colors.black54,
              size: 32,
            ),
          )),
          FacilitiesItem(IconButton(
            icon: Icon(
              Icons.pool_outlined,
              color: Colors.black54,
              size: 32,
            ),
          )),
          FacilitiesItem(IconButton(
            icon: Icon(
              Icons.local_parking_outlined,
              color: Colors.black54,
              size: 32,
            ),
          ))
        ],
      ),
    );
  }
}
