import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  Function onChange = () {};

  SearchBar(this.onChange);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(74, 95, 149, 0.1),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          Container(
            width: 300.0,
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search hotels', border: InputBorder.none),
              onChanged: (data) {
                this.onChange(data);
              },
            ),
          ),
        ],
      ),
    );
  }
}
