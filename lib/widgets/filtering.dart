import 'package:flutter/material.dart';

class Filtering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: _width / 4,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              'Salads',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: _width / 4,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              'Soups',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Container(
          width: _width / 4,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              'Grilled',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Icon(Icons.filter_list),
      ],
    );
  }
}
