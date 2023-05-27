import 'package:flutter/material.dart';

import '../View/Expense/expense_screen.dart';
import '../View/leaves/leave_screen.dart';
import '../View/notification/notification_screen.dart';
import 'color_helper.dart';

class Global {

  commonDrawer(
      {required BuildContext context,
      required Size size,
      required GlobalKey<ScaffoldState> key}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ));
          },
          child: Container(
            height: size.height * 0.040,
            width: size.width * 0.40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorHelper.kPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text("Notification",
                style: TextStyle(color: ColorHelper.fontColor)),
          ),
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LeaveScreen(),
                ));
          },
          child: Container(
            height: size.height * 0.040,
            width: size.width * 0.40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorHelper.kPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                Text("leave", style: TextStyle(color: ColorHelper.fontColor)),
          ),
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpenseScreen(),
                ));
            key.currentState!.closeDrawer();
          },
          child: Container(
            height: size.height * 0.040,
            width: size.width * 0.40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorHelper.kPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text("Expenses",
                style: TextStyle(color: ColorHelper.fontColor)),
          ),
        ),
      ],
    );
  }
}
