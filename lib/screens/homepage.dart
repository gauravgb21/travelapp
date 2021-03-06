import 'package:flutter/material.dart';

import '../components/welcome_msg.dart';
import '../components/bl_nav_item.dart';
import '../components/recommendation_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Travel App',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        color: Colors.white,
        child: ListView(
          children: [
            Container(child: WelcomeMsg()),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'What are you looking for ?',
                  style: Theme.of(context).textTheme.headline6,
                )),
            Container(
              height: 100.0,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BLNavItem(
                      IconButton(
                        icon: Icon(
                          Icons.flight,
                          color: Theme.of(context).primaryColor,
                          size: 32,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/flightsearch');
                        },
                      ),
                      'Flight'),
                  BLNavItem(
                      IconButton(
                        icon: Icon(
                          Icons.apartment,
                          color: Theme.of(context).primaryColor,
                          size: 32,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/hotelsearch');
                        },
                      ),
                      'Hotels'),
                  BLNavItem(
                      IconButton(
                        icon: Icon(
                          Icons.family_restroom,
                          color: Theme.of(context).primaryColor,
                          size: 32,
                        ),
                      ),
                      'Holidays'),
                  BLNavItem(
                      IconButton(
                        icon: Icon(
                          Icons.today,
                          color: Theme.of(context).primaryColor,
                          size: 35,
                        ),
                      ),
                      'Events')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'Popular Destinations',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 300,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: RecommendationList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: IconButton(
                    icon: Icon(
                  Icons.home_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                )),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: IconButton(
                    icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black54,
                )),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: IconButton(
                      icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 30,
                    color: Colors.black54,
                  ))),
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: IconButton(
                    icon: Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                  color: Colors.black54,
                )),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: IconButton(
                      icon: Icon(
                    Icons.person_outline_outlined,
                    size: 30,
                    color: Colors.black54,
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
