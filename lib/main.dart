import 'package:expense/Common/bottom_bar_screen.dart';
import 'package:expense/Controller/bottom_bar_controller.dart';
import 'package:expense/Controller/drawer_controller.dart';
import 'package:expense/Controller/expense_controller.dart';
import 'package:expense/Controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialBinding: BaseBindings(),
        home: const BottomBarScreen(),
        // home: LeaveScreen(),
      ),
    );
  }
}

class BaseBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DrawerGetController(), fenix: true);
    Get.lazyPut(() => ExpenseScreenController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => BottomBarController(), fenix: true);
  }
}
