import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/utils/asset_path.dart';

class OnboardingController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxList<Map<String, String>> onboardingData = [
    {
      'image': AssetPath.onboardingImgOne,
      'title': 'Discover the best events near you',
      'description':
          "Let's find the next unforgettable event near you with just one of our best apps",
    },
    {
      'image': AssetPath.onboarding1,
      'title': 'Create and Find Events Easily in One Place',
      'description':
          'In this app you can create any kind of events and you can join all events ',
    },
  ].obs;

  void nextPage() {
    if (currentIndex.value < onboardingData.length - 1) {
      currentIndex.value += 1;
    }
  }
}
