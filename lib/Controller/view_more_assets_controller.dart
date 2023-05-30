import 'package:get/get.dart';

class ViewMoreAssetsController extends GetxController {
  int index = 0;

  updateValue(value) {
    index = value;
    update();
  }
}
