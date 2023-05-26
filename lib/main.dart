import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/Expense/expense_screen.dart';
import 'View/leaves/leave_screen.dart';
import 'View/notification/notification_screen.dart';

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
      home: const NotificationScreen(),
    );
  }
}
