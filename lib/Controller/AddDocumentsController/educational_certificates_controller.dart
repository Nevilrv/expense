import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationController extends GetxController {
  PlatformFile? file1;
  String fileName = '';

  Future filePicker() async {
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
