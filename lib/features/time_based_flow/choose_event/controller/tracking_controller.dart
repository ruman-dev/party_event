import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TrackingController extends GetxController {
  var switchBtn = false.obs;
  final stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);

  void toggleBtn(RxBool toggle) {
    switchBtn.value = toggle.value;
  }
}
