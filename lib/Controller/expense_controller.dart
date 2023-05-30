import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../View/Assets/add_assets_screen.dart';
import '../View/Documents/add_document_screen.dart';
import '../View/Expense/add_expense_screen.dart';
import '../constant/color_helper.dart';

class ExpenseScreenController extends GetxController {
  int select = 0;

  DateTime dateOfBirth = DateTime.now();

  changeValue(value) {
    select = value;
    update();
  }

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

  Future pickDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateOfBirth,
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
    if (picked != null && picked != dateOfBirth) {
      dateOfBirth = picked;
      update();
    }
  }

  List<Map<String, dynamic>> tabs = [
    {
      'title': 'Expense',
      'view': 'Add Expense',
      'screen': const AddExpense(),
    },
    {
      'title': 'Assets',
      'view': 'Request Assets',
      'screen': const AddAssets(),
    },
    {
      'title': 'Documents',
      'view': 'Add Documents',
      'screen': const AddDocumentScreen(),
    },
    {
      'title': 'Work',
      'view': 'Add Work',
      'screen': const SizedBox(),
    },
    {
      'title': 'Personal',
      'view': 'Add Personal',
      'screen': const SizedBox(),
    },
  ];
}
