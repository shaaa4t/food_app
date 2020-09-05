import 'package:flutter/material.dart';

class BottomHeader extends StatelessWidget {
  final String price;
  BottomHeader({@required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '\$$price',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/rectangle.png'),
            ),
          ),
          child: Center(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 20,
                ),
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
