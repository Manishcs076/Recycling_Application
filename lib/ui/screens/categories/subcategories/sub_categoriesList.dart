// ignore_for_file: file_names

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recycling_application/ui/screens/individual_sucategories_screen/individual_subcategories_screen.dart';
import 'package:recycling_application/ui/utils/staggered_animation.dart';

import '../../../../controllers/basic_controller.dart';
import '../../../utils/hamburger_icon_widget.dart';
import '../../scanner_screen/custom_scanner.dart';

class SubCategoriesList extends StatefulWidget {
  static const String id = '/sorting-screen';
  const SubCategoriesList({super.key});

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _sizeHeight;
  late Animation<double> _sizeWidth;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _position = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1),
      ),
    )..addListener(() {
        setState(() {});
      });
    _sizeHeight = Tween<double>(begin: 35, end: 70).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1),
      ),
    )..addListener(() {
        setState(() {});
      });
    _sizeWidth = Tween<double>(begin: 70, end: 120).animate(
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

  final basicController = Get.find<BasicController>();
  List stats = [
    {
      "name1": "Plastic",
      "name2": "",
      "image": "assets/images/coffee.svg",
    },
    {
      "name1": "Disposable",
      "name2": "tableware",
      "image": "assets/images/menu-bar.svg",
    },
    {
      "name1": "Paper and",
      "name2": "cardboard",
      "image": "assets/images/menu-bar.svg",
    },
    {
      "name1": "Glass",
      "name2": "",
      "image": "assets/images/coffee.svg",
    },
    {
      "name1": "Metal",
      "name2": "",
      "image": "assets/images/coffee.svg",
    },
    {
      "name1": "Tetra Pak",
      "name2": "",
      "image": "assets/images/menu-bar.svg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
            Color(0xffE7E7E7),
            Color(0xffE7E7E7),
            Color(0xffE7E7E7),
            Color(0xffE7E7E7),
            Color(0xffE7E7E7),
            Color(0xffE7E7E7),
            Color(0xffE7E7E7),
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white
          ])),
      child: Scaffold(
        // By defaut, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 70.r,
                      left: 150.r,
                      bottom: 20.r,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CommonHamburger(
                        boxShadowColor:
                            const Color(0xffECD3C2).withOpacity(0.3),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.r,
                      top: 10.r,
                      bottom: 20.r,
                    ),
                    child: Text(
                      basicController.categoryTitle.value,
                      style: TextStyle(
                        fontSize: 30.h,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0.sp,
                      ),
                    ),
                  ),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: stats.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 0.92,
                            crossAxisCount: 2,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 25),
                    itemBuilder: (BuildContext context, int index) {
                      return _categoryCards(index);
                    },
                  ),
                ],
              ),
            ),
            StaggeredAnimation(
              index: 0,
              slideVertical: true,
              slideOffset: 100.0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const CustomScannerScreen());
                  },
                  child: Transform.scale(
                    scale: 1.2,
                    child: AnimatedContainer(
                      height: _sizeHeight.value,
                      width: _sizeWidth.value,
                      color: Colors.transparent,
                      duration: const Duration(seconds: 1),
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 189, 189, 189)
                              .withOpacity(0.8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100.0.r),
                            topRight: Radius.circular(100.0.r),
                          ),
                        ),
                        duration: const Duration(seconds: 0),
                        curve: Curves.fastOutSlowIn,
                        child: Padding(
                            padding: EdgeInsets.only(
                              top: _position.value,
                              left: _position.value,
                              right: _position.value,
                            ),
                            child: AnimatedContainer(
                              // Use the properties stored in the State class.

                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(90.0.r),
                                  topRight: Radius.circular(90.0.r),
                                ),
                              ),
                              // Define how long the animation should take.
                              duration: const Duration(seconds: 0),
                              // Provide an optional curve to make the animation feel smoother.
                              curve: Curves.fastOutSlowIn,
                              child: Center(
                                child: Text(
                                  "Scan",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _categoryCards(index) {
    var num = index;
    if (num % 2 == 0) {
      return StaggeredAnimation(
        index: index,
        slideVertical: false,
        slideOffset: -100.0,
        child: GestureDetector(
          onTap: () {
            basicController.subCategoryTitle1.value =
                stats.elementAt(index)['name1'];
            basicController.subCategoryTitle2.value =
                stats.elementAt(index)['name2'];
            Get.to(() => const IndividualSubCategoriesScreen());
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            elevation: 5,
            margin: EdgeInsets.zero,
            color: const Color(0xffFAF5F2).withOpacity(0.9),
            child: Padding(
              padding: EdgeInsets.only(left: 30.r, top: 30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    stats.elementAt(index)['image'],
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          repeatForever: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                                stats.elementAt(index)['name1'],
                                curve: Curves.easeIn,
                                speed: const Duration(milliseconds: 50)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          repeatForever: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                                stats.elementAt(index)['name2'],
                                curve: Curves.easeIn,
                                speed: const Duration(milliseconds: 50)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return StaggeredAnimation(
        index: index,
        slideVertical: false,
        slideOffset: 100.0,
        child: GestureDetector(
          onTap: () {
            basicController.subCategoryTitle1.value =
                stats.elementAt(index)['name1'];
            basicController.subCategoryTitle2.value =
                stats.elementAt(index)['name2'];
            Get.to(() => const IndividualSubCategoriesScreen());
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            elevation: 5,
            margin: EdgeInsets.zero,
            color: const Color(0xffFAF5F2).withOpacity(0.9),
            child: Padding(
              padding: EdgeInsets.only(left: 30.r, top: 30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    stats.elementAt(index)['image'],
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          repeatForever: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                                stats.elementAt(index)['name1'],
                                curve: Curves.easeIn,
                                speed: const Duration(milliseconds: 50)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          repeatForever: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              stats.elementAt(index)['name2'],
                              curve: Curves.easeIn,
                              speed: const Duration(milliseconds: 50),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
