import 'package:flutter/material.dart';

import './destination_card.dart';

class RecommendationList extends StatefulWidget {
  @override
  _RecommendationListState createState() => _RecommendationListState();
}

class _RecommendationListState extends State<RecommendationList> {
  final List<Map<String, dynamic>> destinationData = [
    {
      "imageUrl": "assets/images/dubai.jpeg",
      "name": "Dubai",
      "visited": "2.5M"
    },
    {"imageUrl": "assets/images/egypt.jpeg", "name": "Egypt", "visited": "1M"},
    {"imageUrl": "assets/images/japan.jpeg", "name": "Japan", "visited": "20K"},
    {
      "imageUrl": "assets/images/london_bridge.jpeg",
      "name": "London",
      "visited": "1.5M"
    },
    {
      "imageUrl": "assets/images/paris.jpeg",
      "name": "Paris",
      "visited": "3.1M"
    },
    {"imageUrl": "assets/images/rome.jpeg", "name": "Rome", "visited": "10K"},
    {
      "imageUrl": "assets/images/sol.jpeg",
      "name": "New York",
      "visited": "2.9M"
    },
    {"imageUrl": "assets/images/taj.jpeg", "name": "India", "visited": "1.5M"}
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ...destinationData.map((item) {
          return (DestinationCard(
              item['imageUrl'], item['name'], item['visited']));
        })
      ],
    );
  }
}
