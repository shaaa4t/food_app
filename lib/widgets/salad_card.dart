import 'package:flutter/material.dart';

class SaladCard extends StatefulWidget {
  final String image;
  final String title;
  final String sub;
  final String price;
  final Function onTap;

  SaladCard({
    @required this.image,
    @required this.title,
    @required this.sub,
    @required this.price,
    @required this.onTap,
  });

  @override
  _SaladCardState createState() => _SaladCardState();
}

class _SaladCardState extends State<SaladCard> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _imageAnim;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _imageAnim =
        CurvedAnimation(parent: _controller, curve: Curves.ease);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: _height * 0.28,
        width: _width / 3,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(_width),
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [

            Positioned(
              bottom: 40,
              right: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.sub,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '\$${widget.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -8,
              right: 0,
              left: 0,
             // width: (_width / 2),
              height: 30,
              child: Container(
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -20,
              right: 0,
              left: 0,
              child: AnimatedBuilder(
                  animation: _imageAnim,
                  builder: (context, snapshot) {
                    return Transform.translate(
                      offset: Offset(0.0,200*(1-_imageAnim.value)),
                      child: Image.asset(
                        widget.image,
                        width: _width / 2.8,
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
