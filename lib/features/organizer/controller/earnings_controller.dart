import 'package:get/get.dart';

class EarningsController extends GetxController {
  RxString earningsSelectedValue = 'Weekly'.obs;
  RxList<String> earningsSelectedItems = [
    'Weekly',
    'Monthly',
    'Yearly',
  ].obs;

  void onChanged(String? newValue) {
    earningsSelectedValue.value = newValue!;
  }
}
