import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recycling_application/ui/screens/categories/category_list_screen.dart';
import 'package:recycling_application/ui/screens/categories/subcategories/sub_categoriesList.dart';
import 'package:recycling_application/ui/screens/individual_sucategories_screen/individual_subcategories_screen.dart';
import 'services/navigator_service.dart';
import 'ui/screens/scanner_screen/custom_scanner.dart';
import 'ui/utils/service_locator.dart';

var navigatorService = locator<NavigatorService>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 772),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: navigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(),
          initialRoute: CategoryListScreen.id,
          // initialBinding: const LandingPage(),
          getPages: [
            GetPage(
              name: CategoryListScreen.id,
              page: () => const CategoryListScreen(),
            ),
            GetPage(
              name: SubCategoriesList.id,
              page: () => const SubCategoriesList(),
            ),
            GetPage(
              name: IndividualSubCategoriesScreen.id,
              page: () => const IndividualSubCategoriesScreen(),
              transition: Transition.rightToLeft,
              transitionDuration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
            ),
            GetPage(
              name: CustomScannerScreen.id,
              page: () => const CustomScannerScreen(),
            ),
          ],
        );
      },
    );
  }
}
