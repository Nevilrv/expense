import 'package:expense/constant/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/leaves/leave_screen.dart';

void main() {
  runApp(const MyApp());

  ///
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, dividerColor: ColorHelper.kPrimary),
      home: const LeaveScreen(),
    );
  }
}
