import 'package:expense/payslip/generate_payslip_screen.dart';
import 'package:expense/payslip/payslip_screen.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/leaves/leave_screen.dart';
import 'View/leaves/request_time_off_screen.dart';
import 'View/letters_screen/letter_requests_screen.dart';
import 'bottom_bar_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: BottomBarScreen(),
      // home: LeaveScreen(),
    );
  }
}
