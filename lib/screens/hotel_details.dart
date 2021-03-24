import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/facilities_list.dart';
import '../components/hotel_details_footer.dart';

class HotelDetails extends StatelessWidget {
  Container getRatingWidget(dynamic ratingValue) {
    List<Icon> iconList = [];
    for (int i = 0; i < ratingValue; i++) {
      iconList.add(Icon(
        Icons.star_rate,
        color: Color.fromRGBO(244, 196, 48, 1),
      ));
    }
    return Container(
      child: Row(
        children: iconList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    return Material(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height * 1) - 90,
                  child: ListView(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 300,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: args['images'].map<Widget>((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                child: Image(
                                  image: AssetImage(i),
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Text(
                          args['name'],
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Row(
                          children: [
                            getRatingWidget(args['rating']),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                              child: Text(
                                '1,023 reviews',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                  args['location'],
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                      Divider(
                        height: 40,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          'About',
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                        child: Text(
                          'There is also a fully equipped kitchen with a washing machine, oven, fridge, microwave, and toaster. Dishes and utensils are also provided. A rainfall shower, complimentary toiletries and a hairdryer are featured in the private bathrooms.',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(
                        height: 40,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          'Facilities',
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      FacilitiesList()
                    ],
                  ),
                ),
                HotelDetailsFooter(args['price'].toString())
              ],
            ),
            Positioned(
              top: 50,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 32,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ));
  }
}
