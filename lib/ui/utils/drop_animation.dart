import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class DropAnimation extends StatelessWidget {
  DropAnimation(
      {Key? key,
      required this.index,
      this.milliseconds = 600,
      this.verticalOffset = 50.0,
      this.horizontalOffset = 50.0,
      this.child})
      : super(key: key);
  int index;
  int milliseconds;
  Widget? child;
  double verticalOffset;
  double horizontalOffset;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
        key: key,
        position: index,
        duration: Duration(milliseconds: milliseconds),
        child: SlideAnimation(
            verticalOffset: verticalOffset,
            horizontalOffset: horizontalOffset,
            child: FadeInAnimation(
              child: child!,
            )));
  }
}
