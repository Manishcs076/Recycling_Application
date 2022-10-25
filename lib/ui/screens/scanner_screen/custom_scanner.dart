import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:recycling_application/ui/widgets/default_container.dart';
import 'package:rive/rive.dart';

import '../../../controllers/basic_controller.dart';
import '../../utils/hamburger_icon_widget.dart';
import '../../utils/staggered_animation.dart';
import '../../widgets/animated_scan_icon.dart';
import '../../widgets/container_with_border_at_corner_only.dart';
import '../categories/category_list_screen.dart';
import 'animated_line.dart';

class CustomScannerScreen extends StatefulWidget {
  static const String id = '/custom-scanner-screen';
  const CustomScannerScreen({super.key});

  @override
  State<CustomScannerScreen> createState() => _CustomScannerScreenState();
}

class _CustomScannerScreenState extends State<CustomScannerScreen>
    with SingleTickerProviderStateMixin {
  String? barcode;
  final basicController = Get.find<BasicController>();

  @override
  void initState() {
    basicController.barCodeResult.value = '';
    super.initState();
  }

  @override
  void dispose() {
    basicController.barCodeResult.value;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Stack(
          children: [
            MobileScanner(
              fit: BoxFit.cover,
              // allowDuplicates: false,
              onDetect: (barcode, args) {
                basicController.barCodeResult.value = barcode.rawValue!;
                print(basicController.barCodeResult.value);
                // setState(() {
                //   this.barcode = barcode.rawValue;
                // });
              },
            ),
            basicController.barCodeResult.value == ''
                ? Positioned(
                    top: 170.r,
                    left: MediaQuery.of(context).size.width / 2.3,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      child: const Text('Scanning'),
                    ),
                  )
                : const SizedBox(),
            Positioned(
              top: 220.r,
              left: MediaQuery.of(context).size.width / 4.6,
              child: const AnimatedLineOverScanner(),
            ),
            Positioned(
              top: 200.r,
              left: MediaQuery.of(context).size.width / 4.6,
              child: const ContainerWithCornerBorderOnly(),
            ),
            Positioned(
              top: 48.r,
              left: MediaQuery.of(context).size.width / 2.3.r,
              child: CommonHamburger(
                boxShadowColor: const Color(0xffECD3C2).withOpacity(0.3),
              ),
            ),
            basicController.barCodeResult.value == ''
                ? Positioned(
                    top: MediaQuery.of(context).size.height * 0.8,
                    left: MediaQuery.of(context).size.width / 2.3.r,
                    child: DefaultContainer(
                      height: 60.h,
                      width: 60.w,
                      containerColor: const Color(0xff5059D9),
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
                        child: AnimatedScanIcon(),
                      ),
                    ),
                    // AnimatedScanIcon(),
                  )
                :

                // animated_scanner_logo
                Align(
                    alignment: Alignment.bottomCenter,
                    child: StaggeredAnimation(
                      index: 0,
                      slideVertical: true,
                      slideOffset: 100.0,
                      child: DefaultContainer(
                        containerColor: Colors.white,
                        height: 240.h,
                        borderWidth: 0,
                        borderColor: Colors.transparent,
                        boxShadowColor: Colors.transparent,
                        boxOffset: const Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 0,
                        borderBottomLeftRadius: 0.r,
                        borderBottomRightRadius: 0.r,
                        borderTopLeftRadius: 10.r,
                        borderTopRightRadius: 10.r,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20.r,
                            right: 20.r,
                            bottom: 10.r,
                            top: 145.r,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 30.h,
                                width: basicController
                                            .barCodeResult.value.length >=
                                        18
                                    ? 290.w
                                    : 180.w,
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  child: Text(
                                    basicController.barCodeResult.value == ''
                                        ? ''
                                        : basicController.barCodeResult.value,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offAll(CategoryListScreen());
                                },
                                child: DefaultContainer(
                                  height: 30.h,
                                  width: 30.w,
                                  borderWidth: 2.r,
                                  borderColor: Colors.black12,
                                  boxShadowColor: Colors.transparent,
                                  boxOffset: const Offset(0, 0),
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                  borderBottomLeftRadius: 10.r,
                                  borderBottomRightRadius: 10.r,
                                  borderTopLeftRadius: 10.r,
                                  borderTopRightRadius: 10.r,
                                  child: const Icon(Icons.close),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            Positioned(
              left: 167.5.r,
              top: 450.r,
              child: basicController.barCodeResult.value == ''
                  ? const SizedBox()
                  : StaggeredAnimation(
                      index: 0,
                      slideVertical: false,
                      slideOffset: 100.0,
                      child: DefaultContainer(
                        containerColor: const Color.fromARGB(
                          255,
                          9,
                          144,
                          235,
                        ),
                        height: 200.h,
                        width: 200.w,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 70.h,
                                  width: 70.w,
                                  child: Padding(
                                    padding: EdgeInsets.all(9.0.r),
                                    child: DefaultContainer(
                                      height: 40.h,
                                      width: 40.w,
                                      containerColor:
                                          const Color.fromARGB(255, 6, 32, 198)
                                              .withOpacity(0.2),
                                      borderWidth: 0,
                                      borderColor: Colors.transparent,
                                      boxShadowColor: Colors.transparent,
                                      boxOffset: const Offset(0, 0),
                                      blurRadius: 0,
                                      spreadRadius: 0,
                                      borderBottomLeftRadius: 28.0.r,
                                      borderBottomRightRadius: 28.0.r,
                                      borderTopLeftRadius: 28.0.r,
                                      borderTopRightRadius: 28.0.r,
                                      child: const Text(''),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10.r,
                                  left: 6.r,
                                  child: SvgPicture.asset(
                                    'assets/images/coffee.svg',
                                    width: 42.w,
                                    height: 60.h,
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20.r,
                              ),
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                child: Text(
                                  basicController.barCodeResult.value == ''
                                      ? 'Scan!'
                                      : basicController.barCodeResult.value,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
