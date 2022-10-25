import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class StaggeredAnimation extends StatelessWidget {
  StaggeredAnimation(
      {Key? key,
      required this.index,
      this.milliseconds = 600,
      this.slideVertical = false,
      this.slideOffset = 50.0,
      this.child})
      : super(key: key);
  int index;
  int milliseconds;
  Widget? child;
  bool slideVertical;
  bool? slideLeft;
  double slideOffset;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
        position: index,
        duration: Duration(milliseconds: milliseconds),
        child: SlideAnimation(
            verticalOffset: slideVertical ? slideOffset : 0.0,
            horizontalOffset: slideVertical ? 0 : slideOffset,
            child: FadeInAnimation(
              child: child!,
            )));
  }
}
