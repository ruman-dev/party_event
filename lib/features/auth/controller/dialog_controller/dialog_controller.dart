import 'package:get/get.dart';

class DialogController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void selectIndex(int index) {
    selectedIndex.value = index;
  }
}
