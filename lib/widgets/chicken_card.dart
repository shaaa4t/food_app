import 'package:flutter/material.dart';

class ChickenCard extends StatefulWidget {
  final String title;
  final String sub;
  final String image;
  final String price;
  final Function onTap;

  ChickenCard({
    @required this.onTap,
    @required this.title,
    @required this.image,
    @required this.sub,
    @required this.price,
  });

  @override
  _ChickenCardState createState() => _ChickenCardState();
}

class _ChickenCardState extends State<ChickenCard> with TickerProviderStateMixin {

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
        height: _height * 0.18,
        width: _width * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(_width),
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [

            Positioned(
              left: (_width * 0.9) / 2.8,
              top: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                   widget.sub,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$${widget.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
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
            ),
            Positioned(
              left: -_width / 4.5,
              top: -50,
              bottom: -50,
              child: AnimatedBuilder(
                  animation: _imageAnim,
                  builder: (context, snapshot) {
                    return Transform.translate(
                      offset: Offset(_width*(1-_imageAnim.value), 0),
                      child: Image.asset(
                        widget.image,
                        width: _width * 0.5,
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
