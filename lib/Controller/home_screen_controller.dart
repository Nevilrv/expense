import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreenController extends GetxController {
  bool Container1 = true;
  bool Container2 = false;
  bool Container3 = false;
  bool Container4 = false;
  bool Container5 = false;
  bool Container6 = false;

  String clockIn = '';
  String clockOut = '';
  String clockIn1 = '';
  String clockOut1 = '';
  final DateFormat timeFormat = DateFormat('hh:mma');
  final DateFormat dateFormat = DateFormat('dd MMMM yyyy');

  Future updateMethod() async {
    update();
  }
}
