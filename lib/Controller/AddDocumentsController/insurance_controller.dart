import 'package:expense/constant/color_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsuranceController extends GetxController {
  DateTime insuranceExpiryDate = DateTime.now();
  DateTime insuranceDate = DateTime.now();

  PlatformFile? file1;
  String fileName = '';

  Future issueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: insuranceDate,
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
    if (picked != null && picked != insuranceDate) {
      insuranceDate = picked;
      update();
    }
  }

  Future expiryDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: insuranceExpiryDate,
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
    if (picked != null && picked != insuranceExpiryDate) {
      insuranceExpiryDate = picked;
      update();
    }
  }

  Future pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      onFileLoading: (p0) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    if (result == null) return;
    final file = result.files.first;
    fileName = file.name;
    file1 = file;
    update();
  }
}
