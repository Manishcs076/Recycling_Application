import 'package:get/get.dart';

class BasicController extends GetxController {
  RxBool isFirstButtonClicked = false.obs;
  RxBool isSecondButtonClicked = false.obs;
  RxString categoryTitle = ''.obs;
  RxString subCategoryTitle1 = "".obs;
  RxString subCategoryTitle2 = "".obs;
  RxBool windowOpened = true.obs;
  RxDouble turns = 0.0.obs;
  RxString barCodeResult = ''.obs;
}
