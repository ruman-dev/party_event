// import 'package:get/get.dart';
//
// class SwitchController extends GetxController {
//   var isSwitchedList = <bool>[].obs;
//   void initializeSwitches(int count) {
//     isSwitchedList.value = List.generate(count, (index) => false);
//   }
//
//   void toggleSwitch(int index, bool value) {
//     isSwitchedList[index] = value;
//   }
// }
import 'package:get/get.dart';

class SwitchController extends GetxController {
  var isSwitched = false.obs;

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }
}
