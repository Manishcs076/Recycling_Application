import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recycling_application/ui/utils/staggered_animation.dart';
import 'package:recycling_application/ui/widgets/default_container.dart';

import '../../../controllers/basic_controller.dart';
import '../../utils/hamburger_icon_widget.dart';
import '../scanner_screen/custom_scanner.dart';

class IndividualSubCategoriesScreen extends StatefulWidget {
  static const String id = '/individual-subcategories-screen';
  const IndividualSubCategoriesScreen({super.key});

  @override
  State<IndividualSubCategoriesScreen> createState() =>
      _IndividualSubCategoriesScreenState();
}

class _IndividualSubCategoriesScreenState
    extends State<IndividualSubCategoriesScreen>
    with SingleTickerProviderStateMixin {
  List subCategorystats = [
    {
      "name1": "Cups and plates",
      "image": "assets/images/coffee.svg",
    },
    {
      "name1": "Plastic appliances",
      "image": "assets/images/coffee.svg",
    },
    {
      "name1": "Food containers",
      "image": "assets/images/coffee.svg",
    },
    {
      "name1": "Paper bags",
      "image": "assets/images/coffee.svg",
    },
    {
      "name1": "Sticks for sushi",
      "image": "assets/images/coffee.svg",
    },
  ];
  final basicController = Get.find<BasicController>();
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _sizeHeight;
  late Animation<double> _sizeWidth;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _position = Tween<double>(begin: 8, end: 0).animate(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.r,
                  right: 18.r,
                  top: 45.r,
                  bottom: 90.r,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 100.r,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    CommonHamburger(
                      boxShadowColor: const Color(
                        0xffECD3C2,
                      ).withOpacity(
                        0.3,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.r, bottom: 20.r),
                child: Row(
                  children: [
                    Text(
                      basicController.subCategoryTitle1.value,
                      style: TextStyle(
                          color: const Color(0xff827D7D),
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      basicController.subCategoryTitle2.value,
                      style: TextStyle(
                        color: const Color(0xff827D7D),
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: subCategorystats.length,
                  itemBuilder: (BuildContext context, int index) {
                    var num = index;
                    if (num % 2 == 0) {
                      return StaggeredAnimation(
                        index: index,
                        slideVertical: false,
                        slideOffset: -100.0,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25.r),
                          child: TweenAnimationBuilder(
                              curve: Curves.easeInToLinear,
                              tween: ColorTween(
                                begin: const Color(
                                  0xff4246B5,
                                ),
                                end: const Color(0xff232323),
                              ),
                              duration: const Duration(seconds: 2),
                              builder:
                                  (BuildContext ctx, Color? color1, child) {
                                return Row(
                                  children: [
                                    DefaultContainer(
                                      containerColor: color1,
                                      height: 70.h,
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      borderWidth: 1.r,
                                      borderColor: const Color(0xff827D7D),
                                      boxShadowColor: Colors.transparent,
                                      boxOffset: const Offset(0, 0),
                                      blurRadius: 0,
                                      spreadRadius: 0,
                                      borderBottomLeftRadius: 0.0.r,
                                      borderBottomRightRadius: 0.0.r,
                                      borderTopLeftRadius: 0.0.r,
                                      borderTopRightRadius: 0.0.r,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 70.h,
                                            width: 8.0.w,
                                            color: const Color(
                                              0xff4246B5,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Stack(
                                            children: [
                                              SizedBox(
                                                height: 55.h,
                                                width: 55.w,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.all(9.0.r),
                                                  child: DefaultContainer(
                                                    height: 20.h,
                                                    width: 20.w,
                                                    containerColor:
                                                        const Color(0xff827D7D)
                                                            .withOpacity(0.2),
                                                    borderWidth: 0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    boxShadowColor:
                                                        Colors.transparent,
                                                    boxOffset:
                                                        const Offset(0, 0),
                                                    blurRadius: 0,
                                                    spreadRadius: 0,
                                                    borderBottomLeftRadius:
                                                        28.0.r,
                                                    borderBottomRightRadius:
                                                        28.0.r,
                                                    borderTopLeftRadius: 28.0.r,
                                                    borderTopRightRadius:
                                                        28.0.r,
                                                    child: const Text(''),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 2.r,
                                                left: 15.r,
                                                child: SvgPicture.asset(
                                                  subCategorystats.elementAt(
                                                      index)['image'],
                                                  width: 42.w,
                                                  height: 45.h,
                                                  color:
                                                      const Color(0xff827D7D),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 18.w,
                                          ),
                                          Text(
                                            subCategorystats
                                                .elementAt(index)['name1'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 70.w,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15.sp,
                                            color: const Color(0xff827D7D),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          MediaQuery.of(context).size.width *
                                              0.85,
                                      height: 70.h,
                                    )
                                  ],
                                );
                              }),
                        ),
                      );
                    } else {
                      return StaggeredAnimation(
                        index: index,
                        slideVertical: false,
                        slideOffset: 100.0,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25.r),
                          child: TweenAnimationBuilder(
                            curve: Curves.easeInToLinear,
                            tween: ColorTween(
                              begin: const Color(
                                0xff4246B5,
                              ),
                              end: const Color(0xff232323),
                            ),
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext ctx1, Color? color2, child) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        MediaQuery.of(context).size.width *
                                            0.85,
                                    height: 70.h,
                                  ),
                                  DefaultContainer(
                                    containerColor: color2,
                                    height: 70.h,
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    borderWidth: 1.r,
                                    borderColor: const Color(0xff827D7D),
                                    boxShadowColor: Colors.transparent,
                                    boxOffset: const Offset(0, 0),
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                    borderBottomLeftRadius: 0.0.r,
                                    borderBottomRightRadius: 0.0.r,
                                    borderTopLeftRadius: 0.0.r,
                                    borderTopRightRadius: 0.0.r,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios,
                                          size: 15.sp,
                                          color: const Color(0xff827D7D),
                                        ),
                                        SizedBox(
                                          width: subCategorystats
                                                      .elementAt(index)['name1']
                                                      .toString()
                                                      .length ==
                                                  10
                                              ? 100.w
                                              : 70.w,
                                        ),
                                        Text(
                                          subCategorystats
                                              .elementAt(index)['name1'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18.w,
                                        ),
                                        Stack(
                                          children: [
                                            SizedBox(
                                              height: 55.h,
                                              width: 55.w,
                                              child: Padding(
                                                padding: EdgeInsets.all(9.0.r),
                                                child: DefaultContainer(
                                                  height: 20.h,
                                                  width: 20.w,
                                                  containerColor:
                                                      const Color(0xff827D7D)
                                                          .withOpacity(0.2),
                                                  borderWidth: 0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  boxShadowColor:
                                                      Colors.transparent,
                                                  boxOffset: const Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 0,
                                                  borderBottomLeftRadius:
                                                      28.0.r,
                                                  borderBottomRightRadius:
                                                      28.0.r,
                                                  borderTopLeftRadius: 28.0.r,
                                                  borderTopRightRadius: 28.0.r,
                                                  child: const Text(''),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 2.r,
                                              left: 15.r,
                                              child: SvgPicture.asset(
                                                subCategorystats
                                                    .elementAt(index)['image'],
                                                width: 42.w,
                                                height: 45.h,
                                                color: const Color(0xff827D7D),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          height: 70.h,
                                          width: 8.0.w,
                                          color: const Color(
                                            0xff4246B5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
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
                  scale: 1.5,
                  child: AnimatedContainer(
                    height: _sizeHeight.value,
                    width: _sizeWidth.value,
                    color: Colors.transparent,
                    duration: const Duration(milliseconds: 300),
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 189, 189, 189)
                            .withOpacity(0.5),
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
                              color: Colors.white,
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
                                    color: Colors.black,
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
    );
  }
}
