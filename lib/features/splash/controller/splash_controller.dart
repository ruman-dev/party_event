import 'package:get/get.dart';
import '../../../core/routes/app_route.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigate();
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoute.onBoardingScreen);
    });
  }
}
