import 'package:get/get.dart';

class BottomBarController extends GetxController {
  int bottomIndex = 0;

  setBottomIndex(value) {
    bottomIndex = value;
    update();
  }
}
