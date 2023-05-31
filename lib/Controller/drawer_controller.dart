import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerGetController extends GetxController
    with SingleGetTickerProviderMixin {
  int index = 0;
  TabController? controller;
  bool isDrawer = false;

  @override
  void onInit() {
    // TODO: implement onInit
    controller = TabController(length: 2, vsync: this);
    super.onInit();
  }

  updateValue(value) {
    index = value;
    update();
  }

  setDrawer(bool value) {
    isDrawer = value;
    update();
  }
}
