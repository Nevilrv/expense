import 'package:get/get.dart';

class ViewMoreExpenseController extends GetxController {
  int index = 0;

  updateValue(value) {
    index = value;
    update();
  }
}
