import 'package:flutter/material.dart';

import '../components/searchbar.dart';
import '../components/hotel_card.dart';

class HotelSearch extends StatefulWidget {
  @override
  _HotelSearchState createState() => _HotelSearchState();
}

class _HotelSearchState extends State<HotelSearch> {
  final List<Map<String, dynamic>> hotelsData = [
    {
      "imageUrl": "assets/images/baglioni_london.jpeg",
      "name": "Hotel Baglioni",
      "location": "london, UK",
      "price": 210,
      "rating": 5,
      "subImages": [
        "assets/images/baglioni_1.jpg",
        "assets/images/baglioni_2.jpeg",
        "assets/images/baglioni_3.jpeg"
      ]
    },
    {
      "imageUrl": "assets/images/corinthia_london.jpeg",
      "name": "Hotel Corinthia",
      "location": "London, UK",
      "price": 200,
      "rating": 5,
      "subImages": [
        "assets/images/corinthia_1.jpeg",
        "assets/images/corinthia_2.jpeg",
        "assets/images/corinthia_3.jpeg"
      ]
    },
    {
      "imageUrl": "assets/images/ginger_hotel_noida.jpeg",
      "name": "Ginger Hotel",
      "location": "Noida, India",
      "price": 80,
      "rating": 4,
      "subImages": [
        "assets/images/ginger_1.jpeg",
        "assets/images/ginger_2.jpeg",
        "assets/images/ginger_3.jpeg"
      ]
    },
    {
      "imageUrl": "assets/images/grange_hotel_london.jpeg",
      "name": "Hotel Grange",
      "location": "London, UK",
      "price": 180,
      "rating": 4,
      "subImages": [
        "assets/images/grange_1.jpeg",
        "assets/images/grange_2.jpeg",
        "assets/images/grange_3.jpeg"
      ]
    },
    {
      "imageUrl": "assets/images/hotel_lutetia_paris.jpeg",
      "name": "Hotel Lutetia",
      "location": "Paris, France",
      "price": 250,
      "rating": 5,
      "subImages": [
        "assets/images/lutetia_1.jpeg",
        "assets/images/lutetia_2.jpeg",
        "assets/images/lutetia_3.jpeg"
      ]
    },
    {
      "imageUrl": "assets/images/hotel_raphael_paris.jpeg",
      "name": "Hotel Raphael",
      "location": "Paris, France",
      "price": 300,
      "rating": 4,
      "subImages": [
        "assets/images/raphael_1.jpeg",
        "assets/images/raphael_2.jpeg",
        "assets/images/raphael_3.jpeg"
      ]
    },
    {
      "imageUrl": "assets/images/montana_hotel_london.jpeg",
      "name": "Montana Hotel",
      "location": "london, UK",
      "price": 190,
      "rating": 4,
      "subImages": [
        "assets/images/montana_1.jpeg",
        "assets/images/montana_2.jpeg",
        "assets/images/montana_3.jpeg"
      ]
    },
    {
      "imageUrl": "assets/images/radisson_blu_delhi.jpeg",
      "name": "Radisson Blu",
      "location": "New Delhi, India",
      "price": 150,
      "rating": 5,
      "subImages": [
        "assets/images/radisson_1.jpeg",
        "assets/images/radisson_2.jpeg",
        "assets/images/radisson_3.jpeg"
      ]
    },
    {
      "imageUrl": "assets/images/renaissance_paris_vendome_hotel.jpeg",
      "name": "Renaissance Paris Vendome",
      "location": "Paris, France",
      "price": 300,
      "rating": 5,
      "subImages": [
        "assets/images/rpv_1.jpeg",
        "assets/images/rpv_2.jpeg",
        "assets/images/rpv_3.jpeg"
      ]
    },
    {
      "imageUrl": "assets/images/the_lalit_new_delhi.jpeg",
      "name": "The Lalit",
      "location": "New Delhi, India",
      "price": 120,
      "rating": 5,
      "subImages": [
        "assets/images/lalit_1.jpeg",
        "assets/images/lalit_2.jpeg",
        "assets/images/lalit_3.jpeg"
      ]
    },
    {
      "imageUrl": "assets/images/the_leela_ambience_delhi.jpeg",
      "name": "The Leela Ambience",
      "location": "New Delhi, India",
      "price": 90,
      "rating": 4,
      "subImages": [
        "assets/images/la_1.jpeg",
        "assets/images/la_2.jpeg",
        "assets/images/la_3.jpeg"
      ]
    }
  ];
  String searchedString = '';

  handleSubmit(String data) {
    setState(() {
      searchedString = data;
    });
  }

  void handleHotelClick(hotelName) {
    int index = -1;
    for (int i = 0; i < hotelsData.length; i++) {
      if (hotelsData[i]['name'] == hotelName) {
        index = i;
        break;
      }
    }
    if (index >= 0) {
      Navigator.pushNamed(context, '/hoteldetails', arguments: {
        'images': [...hotelsData[index]['subImages']],
        'name': hotelsData[index]['name'],
        'rating': hotelsData[index]['rating'],
        'price': hotelsData[index]['price'],
        'location': hotelsData[index]['location']
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Hotels',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 38.0,
            color: Theme.of(context).primaryColor,
          ),
          splashRadius: 20.0,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 1.0,
        width: MediaQuery.of(context).size.width * 1.0,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            SearchBar(this.handleSubmit),
            Container(
              height: (MediaQuery.of(context).size.height * 1) - 200,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ListView(
                children: [
                  ...hotelsData
                      .where((element) => (element['name']
                          .toLowerCase()
                          .contains(searchedString.toLowerCase())))
                      .map((item) {
                    return (HotelCard(
                        item['imageUrl'],
                        item['name'],
                        item['location'],
                        item['price'],
                        item['rating'],
                        this.handleHotelClick));
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
