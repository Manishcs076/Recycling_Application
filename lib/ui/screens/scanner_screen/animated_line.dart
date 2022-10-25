import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../controllers/basic_controller.dart';

class AnimatedLineOverScanner extends StatefulWidget {
  // static const String id = '/individual-subcategories-screen';
  const AnimatedLineOverScanner({super.key});

  @override
  State<AnimatedLineOverScanner> createState() => _AnimatedLineOverScanner();
}

class _AnimatedLineOverScanner extends State<AnimatedLineOverScanner>
    with SingleTickerProviderStateMixin {
  final basicController = Get.find<BasicController>();
  late AnimationController _controller;

  late Animation<double> _sizeHeight;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // _position = Tween<double>(begin: 8, end: 0).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0, 1),
    //   ),
    // )..addListener(() {
    //     setState(() {});
    //   });
    _sizeHeight = Tween<double>(begin: 2.h, end: 300.h).animate(
      // height: 300.h,
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1),
      ),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat(
        period: const Duration(
          seconds: 2,
        ),
        reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _sizeHeight.value,
      width: 200.w,
      color: Colors.transparent,
      duration: const Duration(milliseconds: 300),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 6, 32, 198).withOpacity(0.1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0.r),
            topRight: Radius.circular(0.0.r),
            bottomLeft: Radius.circular(0.0.r),
            bottomRight: Radius.circular(0.0.r),
          ),
        ),
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Divider(
            thickness: 1.r,
            color: const Color.fromARGB(255, 6, 32, 198),
          ),
        ),
      ),
    );
  }
}
