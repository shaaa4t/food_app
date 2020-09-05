import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width * 0.9,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(_width),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600],
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/home.png',width: 24,),
          Image.asset('assets/images/wallet.png',width: 24,),
          Image.asset('assets/images/chat.png',width: 24,),
          Icon(
            Icons.person_outline,
            color: Colors.white,
            size: 28,
          ),
        ],
      ),
    );
  }
}
