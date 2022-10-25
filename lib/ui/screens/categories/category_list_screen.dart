import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:recycling_application/ui/screens/categories/subcategories/sub_categoriesList.dart';
import 'package:recycling_application/ui/utils/drop_animation.dart';
import 'package:recycling_application/ui/widgets/default_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import '../../../controllers/basic_controller.dart';

class CategoryListScreen extends StatefulWidget {
  static const String id = '/category-list-screen';
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

// final basicController = Get.find<BasicController>();

class _CategoryListScreenState extends State<CategoryListScreen>
    with TickerProviderStateMixin {
  double turns = 0.0;

  AnimationController? _controller;

  final basicController = Get.put(BasicController());
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Obx(
              () => Visibility(
                visible: basicController.windowOpened.isTrue,
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: Center(
                      child: Lottie.asset(
                        'assets/images/abcd.json',
                        width: 130.w,
                        height: 100.h,
                        fit: BoxFit.fill,
                        repeat: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.r,
                      bottom: 100.r,
                    ),
                    child: Center(
                      child: Text(
                        "Sorting",
                        style: TextStyle(
                          fontSize: 44.h,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0.sp,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Obx(() => Visibility(
                  visible: basicController.windowOpened.isFalse,
                  child: DropAnimation(
                    index: 0,
                    verticalOffset: -100.0,
                    horizontalOffset: -100.0,
                    child: GestureDetector(
                      onTap: () {
                        basicController.categoryTitle.value = "Sorting";
                        Get.to(() => const SubCategoriesList());
                      },
                      child: DefaultContainer(
                        containerColor:
                            const Color(0xff3D57CB).withOpacity(0.9),
                        width: 179.w,
                        height: 385.h,
                        borderWidth: 0,
                        borderColor: Colors.black,
                        boxShadowColor: Colors.transparent,
                        boxOffset: const Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 0,
                        borderBottomLeftRadius: 0,
                        borderBottomRightRadius: 0,
                        borderTopLeftRadius: 0,
                        borderTopRightRadius: 0,
                        child: Center(
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              color: Colors.white,
                              letterSpacing: 0.2.sp,
                              wordSpacing: 0.2.sp,
                            ),
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              animatedTexts: [
                                TypewriterAnimatedText("Sorting",
                                    curve: Curves.easeIn,
                                    speed: const Duration(milliseconds: 100)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Obx(() => Visibility(
                  visible: basicController.windowOpened.isFalse,
                  child: DropAnimation(
                    index: 0,
                    verticalOffset: -100.0,
                    horizontalOffset: 100.0,
                    child: GestureDetector(
                      onTap: () {
                        basicController.categoryTitle.value = "Location";
                        Get.to(() => const SubCategoriesList());
                      },
                      child: DefaultContainer(
                        containerColor:
                            const Color(0xff3D57CB).withOpacity(0.9),
                        width: 179.w,
                        height: 385.h,
                        borderWidth: 0,
                        borderColor: Colors.black,
                        boxShadowColor: Colors.transparent,
                        boxOffset: const Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 0,
                        borderBottomLeftRadius: 0,
                        borderBottomRightRadius: 0,
                        borderTopLeftRadius: 0,
                        borderTopRightRadius: 0,
                        child: Center(
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              color: Colors.white,
                              letterSpacing: 0.2.sp,
                              wordSpacing: 0.2.sp,
                            ),
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              animatedTexts: [
                                TypewriterAnimatedText("Location",
                                    curve: Curves.easeIn,
                                    speed: const Duration(milliseconds: 100)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Obx(() => Visibility(
                  visible: basicController.windowOpened.isFalse,
                  child: DropAnimation(
                    index: 0,
                    verticalOffset: 100.0,
                    horizontalOffset: -100.0,
                    child: GestureDetector(
                      onTap: () {
                        basicController.categoryTitle.value = "Scan";
                        Get.to(() => const SubCategoriesList());
                      },
                      child: DefaultContainer(
                        containerColor:
                            const Color(0xff3D57CB).withOpacity(0.9),
                        width: 179.w,
                        height: 385.h,
                        borderWidth: 0,
                        borderColor: Colors.black,
                        boxShadowColor: Colors.transparent,
                        boxOffset: const Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 0,
                        borderBottomLeftRadius: 0,
                        borderBottomRightRadius: 0,
                        borderTopLeftRadius: 0,
                        borderTopRightRadius: 0,
                        child: Center(
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              color: Colors.white,
                              letterSpacing: 0.2.sp,
                              wordSpacing: 0.2.sp,
                            ),
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  "Scan",
                                  curve: Curves.easeIn,
                                  speed: const Duration(
                                    milliseconds: 100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Obx(() => Visibility(
                  visible: basicController.windowOpened.isFalse,
                  child: DropAnimation(
                    index: 0,
                    verticalOffset: 100.0,
                    horizontalOffset: 100.0,
                    child: GestureDetector(
                      onTap: () {
                        basicController.categoryTitle.value = "Info";
                        Get.to(() => const SubCategoriesList());
                      },
                      child: DefaultContainer(
                        containerColor:
                            const Color(0xff3D57CB).withOpacity(0.9),
                        width: 179.w,
                        height: 385.h,
                        borderWidth: 0,
                        borderColor: Colors.black,
                        boxShadowColor: Colors.transparent,
                        boxOffset: const Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 0,
                        borderBottomLeftRadius: 0,
                        borderBottomRightRadius: 0,
                        borderTopLeftRadius: 0,
                        borderTopRightRadius: 0,
                        child: Center(
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              color: Colors.white,
                              letterSpacing: 0.2.sp,
                              wordSpacing: 0.2.sp,
                            ),
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  "Info",
                                  curve: Curves.easeIn,
                                  speed: const Duration(
                                    milliseconds: 100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                if (basicController.windowOpened.isTrue) {
                  _controller?.forward();
                  basicController.windowOpened.value = false;
                } else {
                  basicController.windowOpened.value = true;
                  _controller?.reverse();
                }
              },
              child: AnimatedContainer(
                width: 60.w,
                height: 60.h,
                curve: Curves.easeOutExpo,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15.0.r,
                  ),
                  color: const Color(0xffECD3C2),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 8.r,
                      blurRadius: 0.r,
                      offset: const Offset(0, 0),
                      color: const Color(0xffECD3C2).withOpacity(0.2),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 60.w,
                  height: 60.h,
                  child: Center(
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _controller!,
                      size: 30.sp,
                      color: const Color(0xff4246B5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Visibility(
                  visible: basicController.windowOpened.isTrue,
                  child: SizedBox(
                    height: 350.h,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 98.r,
                          left: 110.r,
                          child: SizedBox(
                            height: 150.h,
                            width: 150.w,
                            child: const RiveAnimation.asset(
                                'assets/images/bin.riv'),
                          ),
                        ),
                        Lottie.asset(
                          'assets/images/efghi.json',
                          width: 200.w,
                          height: 330.h,
                          fit: BoxFit.fill,
                          repeat: false,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
