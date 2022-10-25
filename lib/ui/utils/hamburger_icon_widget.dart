import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/default_container.dart';

// ignore: must_be_immutable
class CommonHamburger extends StatefulWidget {
  CommonHamburger({super.key, this.boxShadowColor});
  Color? boxShadowColor;

  @override
  State<CommonHamburger> createState() => _CommonHamburgerState();
}

class _CommonHamburgerState extends State<CommonHamburger> {
  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      width: 60.w,
      height: 60.h,
      containerColor: const Color(0xffECD3C2),
      borderWidth: 0.0,
      borderColor: Colors.transparent,
      boxShadowColor: widget.boxShadowColor!,
      boxOffset: const Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 8.r,
      borderBottomLeftRadius: 15.r,
      borderBottomRightRadius: 15.r,
      borderTopLeftRadius: 15.r,
      borderTopRightRadius: 15.r,
      child: Center(
        child: SvgPicture.asset(
          "assets/images/menu-bar.svg",
          height: 20.h,
          width: 20.w,
          color: const Color(0xff4246B5),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
