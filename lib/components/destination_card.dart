import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  final String imageSrc, destinationName, visitedCount;

  DestinationCard(this.imageSrc, this.destinationName, this.visitedCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            child: Image(
              image: AssetImage(imageSrc),
              width: 150,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              destinationName,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              this.visitedCount + ' Visited',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
