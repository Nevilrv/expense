import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ExpenseScreenController extends GetxController {
  int select = 0;

  changeValue(value) {
    select = value;
    update();
  }

/*  XFile? imageFile;
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = XFile(pickedFile.path);
    }
    update();
  }

  Future getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      imageFile = XFile(pickedFile.path);
    }
    update();
  }*/

  File? imageFile;
  Future getImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    update();
  }

  Future getImageFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    update();
  }
}
