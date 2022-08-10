import 'package:booking_movie_ticket/app/common/constants.dart';
import 'package:booking_movie_ticket/app/widgets/rolling_item.dart';
import 'package:booking_movie_ticket/app/widgets/rolling_painter.dart';
import 'package:flutter/material.dart';

class RollingBottomBar extends StatefulWidget {
  /// Controller for animation
  final PageController? controller;

  /// List of items to render into the bottom bar
  final List<RollingBottomBarItem>? items;

  /// Function called when an item was tapped
  final ValueChanged<int>? onTap;

  /// Color to paint the custom paint and draw the bottom bar
  final Color color;

  /// Color to indicate the unactive item
  final Color? itemColor;

  /// Color to indicate the active item
  final Color? activeItemColor;

  /// Boolean value to indicate if rotate effect will be triggered
  final bool? enableIconRotation;

  /// Boolean value to indicate if the bottom bar has shadow or not
  final bool? flat;

  /// Boolean value to indicate when to use individual active color for each child
  final bool? useActiveColorByDefault;

  const RollingBottomBar(
      {Key? key,
      @required this.controller,
      @required this.items,
      @required this.onTap,
      this.color = Colors.white,
      this.itemColor,
      this.activeItemColor = Colors.green,
      this.enableIconRotation,
      this.flat = false,
      this.useActiveColorByDefault = true})
      : super(key: key);

  @override
  _RollingBottomBarState createState() => _RollingBottomBarState();
}

class _RollingBottomBarState extends State<RollingBottomBar> {
  double? _screenWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final width = _size.width;
    const height = kHeight + kMargin * 2;

    return AnimatedBuilder(
      animation: widget.controller!,
      builder: (BuildContext _, Widget? child) {
        double _scrollPosition = 0.0;
        int _currentIndex = 0;
        if (widget.controller?.hasClients ?? false) {
          _scrollPosition = widget.controller!.page!;
          _currentIndex = (widget.controller!.page! + 0.5).toInt();
        }

        return Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            CustomPaint(
              size: Size(width, height),
              painter: RollingPainter(
                  x: _itemXByScrollPosition(_scrollPosition),
                  color: widget.color,
                  flat: widget.flat),
            ),
            for (var i = 0; i < widget.items!.length; i++) ...[
              if (i == _currentIndex)
                Positioned(
                  top: kMargin - kCircleRadius + 8.0,
                  left: kCircleMargin + _itemXByScrollPosition(_scrollPosition),
                  child: RollingActiveItem(
                    i,
                    iconData: widget.items![i].iconData,
                    color: widget.useActiveColorByDefault!
                        ? widget.activeItemColor
                        : widget.items![i].activeColor,
                    scrollPosition: _scrollPosition,
                    enableRotation: widget.enableIconRotation,
                    onTap: widget.onTap,
                  ),
                ),
              if (i != _currentIndex)
                Positioned(
                  top: kMargin + (kHeight - kCircleRadius * 2) / 2,
                  left: kCircleMargin + _itemXByIndex(i),
                  child: RollingItem(
                    i,
                    iconData: widget.items![i].iconData,
                    label: widget.items![i].label,
                    color: widget.itemColor,
                    onTap: widget.onTap,
                  ),
                ),
            ],
          ],
        );
      },
    );
  }

  double _firstItemX() {
    return kMargin + (_screenWidth! - kMargin * 2) * 0.1;
  }

  double _lastItemX() {
    return _screenWidth! -
        kMargin -
        (_screenWidth! - kMargin * 2) * 0.1 -
        (kCircleRadius + kCircleMargin) * 2;
  }

  double _itemDistance() {
    return (_lastItemX() - _firstItemX()) / (widget.items!.length - 1);
  }

  double _itemXByScrollPosition(double scrollPosition) {
    return _firstItemX() + _itemDistance() * scrollPosition;
  }

  double _itemXByIndex(int index) {
    return _firstItemX() + _itemDistance() * index;
  }
}
