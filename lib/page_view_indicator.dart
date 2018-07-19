import 'dart:math';
import 'package:flutter/material.dart';

class PageViewIndicator extends StatefulWidget {
  PageViewIndicator({
    this.controller,
    this.pageCount,
    this.color: Colors.lightBlueAccent,
  });

  final PageController controller;

  final int pageCount;

  final Color color;

  static const double _indicatorSize = 8.0;

  static const double _indicatorZoom = 2.0;

  static const double _indicatorSpacing = 25.0;

  @override
  PageViewIndicatorState createState() => PageViewIndicatorState();
}

class PageViewIndicatorState extends State<PageViewIndicator> {
  double _page = 0.0;

  void initState() {
    super.initState();
    widget.controller.addListener(_pageListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_pageListener);
    super.dispose();
  }

  void _pageListener() {
    if (widget.controller.hasClients) {
      setState(() {
        _page = widget.controller.page ?? widget.controller.initialPage;
      });
    }
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.pageCount, _buildDot),
    );
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(0.0, 1.0 - (_page - index).abs()),
    );
    double zoom = 1.0 + (PageViewIndicator._indicatorZoom - 1.0) * selectedness;

    return Container(
      width: PageViewIndicator._indicatorSpacing,
      child: Material(
        color: widget.color,
        type: MaterialType.circle,
        child: SizedBox(
          width: PageViewIndicator._indicatorSize * zoom,
          height: PageViewIndicator._indicatorSize * zoom,
        ),
      ),
    );
  }
}
