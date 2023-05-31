import 'dart:ui';

import 'package:expense/View/TeamScreen/team_screen.dart';
import 'package:expense/View/payslip/payroll_components_screen.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../View/ErrorScreen/error_state_1.dart';
import '../View/Expense/expense_screen.dart';

import '../View/letters_screen/letter_requests_screen.dart';
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
        // SizedBox(
        //   height: size.height * 0.020,
        // ),
        // InkWell(
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const PayrollComponentScreen(),
        //         ));
        //   },
        //   child: Container(
        //     height: size.height * 0.040,
        //     width: size.width * 0.40,
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(
        //       color: ColorHelper.kPrimary,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Text("Payroll Components",
        //         style: TextStyle(color: ColorHelper.fontColor)),
        //   ),
        // ),
        SizedBox(
          height: size.height * 0.020,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExpenseScreen(),
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
        SizedBox(
          height: size.height * 0.020,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LetterRequestsScreen(),
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
            child: Text("Letter Screen",
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
                  builder: (context) => ErrorRequestScreen1(),
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
            child: Text("Error Screen",
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
                  builder: (context) => const TeamScreen(),
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
            child: Text("Team", style: TextStyle(color: ColorHelper.fontColor)),
          ),
        ),
      ],
    );
  }

  commonPopUp({required String title}) {
    return Get.generalDialog(
      barrierDismissible: true,
      barrierLabel: "",
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.1),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          contentPadding: const EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          content: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  SvgPicture.asset('assets/icons/tick-circle.svg', height: 40),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.kWhite16W400Inter,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.back();
                    },
                    child: Container(
                      width: 151,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorHelper.kPrimary,
                        borderRadius: BorderRadius.circular(56),
                      ),
                      child: Center(
                        child: Text('Go back home',
                            style: TextStyleHelper.kBG14W600Inter),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: FadeTransition(
          opacity: anim1,
          child: child,
        ),
      ),
    );
  }
}
