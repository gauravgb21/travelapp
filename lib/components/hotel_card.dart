import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final String imageSrc, hotelName, hotelLocation;
  final int price, rating;
  Function onHotelClick = () {};

  HotelCard(this.imageSrc, this.hotelName, this.hotelLocation, this.price,
      this.rating, this.onHotelClick);

  Container getRatingWidget(dynamic ratingValue) {
    List<Icon> iconList = [];
    for (int i = 0; i < rating; i++) {
      iconList.add(Icon(
        Icons.star_rate,
        color: Color.fromRGBO(244, 196, 48, 1),
      ));
    }
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Row(
        children: iconList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onHotelClick(this.hotelName),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              child: Image(
                image: AssetImage(imageSrc),
                width: double.infinity,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(this.hotelName,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        this.getRatingWidget(this.rating),
                      ]),
                  Column(children: [
                    Text("\$" + this.price.toString(),
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text('per night',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ])
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text(
                        this.hotelLocation,
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
