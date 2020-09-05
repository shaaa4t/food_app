import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class DisplayPageIndicators extends StatelessWidget {
  final int length;
  final ValueNotifier<int> pageViewNotifier;

   DisplayPageIndicators({@required this.length, this.pageViewNotifier});

  @override
  Widget build(BuildContext context) {

    return PageViewIndicator(
      pageIndexNotifier: pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Container(
        width: 12.0,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      indicatorPadding: EdgeInsets.only(right: 5, top: 16),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.fastLinearToSlowEaseIn,
        ),
        child: Container(
          width: 18.0,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
