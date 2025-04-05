import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  RxString selectedCountry = '+154556511488'.obs;
  RxString selectedFlag = '🇬🇧'.obs;

  List<Map<String, String>> countries = [
    {'name': '+154556511488', 'flag': '🇬🇧'},
    {'name': '+018054565667', 'flag': '🇦🇫'},
  ];

  void updateSelectedCountry(String countryName) {
    if (selectedCountry.value != countryName) {
      var selected =
          countries.firstWhere((country) => country['name'] == countryName);
      selectedCountry.value = selected['name']!;
      selectedFlag.value = selected['flag']!;
      update();
    }

    debugPrint('===========>>>>>Selected Country: ${selectedCountry.value}');
  }
}
