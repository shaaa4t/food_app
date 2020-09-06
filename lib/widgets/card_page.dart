import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final ValueNotifier<int> pageViewNotifier;
  final String image;

  CardPage({
    @required this.pageViewNotifier,
    @required this.image,
  });

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> with TickerProviderStateMixin {
  PageController _pageController;
  AnimationController _controller;
  Animation<double> _imageAnim;
  double pageOffset = 0;



  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _imageAnim =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    _pageController = PageController(viewportFraction: 1);
    _pageController.addListener(() {
      setState(() {
        pageOffset = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      height: _height / 2.2,
      width: _width,
      child: PageView.builder(
        onPageChanged: (index) {
          widget.pageViewNotifier.value = index;
        },
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            height: _height / 2,
            width: _width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 20,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 20,
                      child: AnimatedBuilder(
                        animation: _imageAnim,
                        builder: (context, snapshot) {
                          return Transform.translate(
                            offset: Offset(-200 * (1 - _imageAnim.value), 0),
                            child: Image.asset(
                              widget.image,
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: -10,
                      right: -50,
                      child: AnimatedBuilder(
                          animation: _imageAnim,
                          builder: (context, snapshot) {
                            return Transform.translate(
                              offset: Offset(200 * (1 - _imageAnim.value), 0),
                              child: Image.asset(
                                'assets/images/geenleaf.png',
                                width: _width / 1.5,
                              ),
                            );
                          }),
                    ),
                   
                    Positioned(
                      top: 20,
                      right: 50,
                      child: AnimatedBuilder(
                          animation: _imageAnime,
                          builder: (context, snapshot) {
                            return Transform.translate(
                              offset: Offset(200 * (1 - _imageAnim.value), 0),
                              child: Image.asset(
                                'assets/images/tommato.png',
                                width: _width * 0.1,
                              ),
                            );
                          }),
                    ),
                    
                    Positioned(
                      bottom: 10,
                      left: -50,
                      child: AnimatedBuilder(
                          animation: _imageAnime,
                          builder: (context, snapshot) {
                            return Transform.translate(
                              offset: Offset(-500*(1-_imageAnim.value),0),
                              child: Image.asset(
                                'assets/images/geenleaf.png',
                                width: _width / 1.5,
                              ),
                            );
                          }),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 50,
                      child: AnimatedBuilder(
                          animation: _imageAnime,
                        builder: (context, snapshot) {
                          return Transform.translate(
                            offset: Offset(-500 * (1 - _imageAnim.value), 0),
                            child: Image.asset(
                              'assets/images/tommato.png',
                              width: _width * 0.1,
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
