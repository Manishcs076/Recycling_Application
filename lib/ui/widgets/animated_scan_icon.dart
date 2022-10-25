import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../controllers/basic_controller.dart';
import 'default_container.dart';

class AnimatedScanIcon extends StatefulWidget {
  const AnimatedScanIcon({super.key});

  @override
  State<AnimatedScanIcon> createState() => _AnimatedScanIconState();
}

class _AnimatedScanIconState extends State<AnimatedScanIcon> {
  final basicController = Get.find<BasicController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        foregroundPainter: BorderPainter(),
        child: DefaultContainer(
          height: 50.h,
          width: 50.w,
          containerColor: Color(0xff5059D9),
          borderWidth: 0,
          borderColor: Colors.transparent,
          boxShadowColor: Colors.transparent,
          boxOffset: const Offset(0, 0),
          blurRadius: 0,
          spreadRadius: 0,
          borderBottomLeftRadius: 10.r,
          borderBottomRightRadius: 10.r,
          borderTopLeftRadius: 10.r,
          borderTopRightRadius: 10.r,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: RiveAnimation.asset(
              'assets/images/animated_scanner_logo.riv',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sh = size.height; // for convenient shortage
    double sw = size.width; // for convenient shortage
    double cornerSide = sh * 0.2; // desirable value for corners side

    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0.w
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    Path path = Path()
      ..moveTo(cornerSide, 0)
      ..quadraticBezierTo(0, 0, 0, cornerSide)
      ..moveTo(0, sh - cornerSide)
      ..quadraticBezierTo(0, sh, cornerSide, sh)
      ..moveTo(sw - cornerSide, sh)
      ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
      ..moveTo(sw, cornerSide)
      ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
