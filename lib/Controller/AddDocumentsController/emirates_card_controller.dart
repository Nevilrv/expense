import 'package:expense/constant/color_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmirateCardController extends GetxController {
  DateTime emiratesDate = DateTime.now();
  DateTime emiratesExpiryDate = DateTime.now();

  PlatformFile? front1;
  String front = '';

  PlatformFile? back1;
  String back = '';

  Future issueDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: Get.overlayContext!,
      initialDate: emiratesDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            splashColor: Colors.white,
            colorScheme: ColorScheme.light(
              primary: ColorHelper.kPrimary,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: ColorHelper.kBG,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      emiratesDate = picked;
      update();
    }
  }

  Future expiryDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: emiratesExpiryDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            splashColor: Colors.white,
            colorScheme: ColorScheme.light(
              primary: ColorHelper.kPrimary,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: ColorHelper.kBG,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != emiratesExpiryDate) {
      emiratesExpiryDate = picked;
      update();
    }
  }

  Future frontImagePicker() async {
    final result = await FilePicker.platform.pickFiles(
      onFileLoading: (p0) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    if (result == null) return;
    final file = result.files.first;
    front = file.name;
    front1 = file;
    update();
  }

  Future backImagePicker() async {
    final result = await FilePicker.platform.pickFiles(
      onFileLoading: (p0) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    if (result == null) return;
    final file = result.files.first;
    back = file.name;
    back1 = file;
    update();
  }
}
