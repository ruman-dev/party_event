import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final Completer<GoogleMapController> _controller = Completer();
  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
}
