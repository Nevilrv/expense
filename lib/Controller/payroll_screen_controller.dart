import 'package:get/get.dart';

class PayrollScreenController extends GetxController {
  int index = 0;

  updateValue(value) {
    index = value;
    update();
  }
}
