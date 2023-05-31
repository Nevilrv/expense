import 'dart:developer';
import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:expense/Controller/drawer_controller.dart';
import 'package:expense/View/TeamScreen/team_screen.dart';
import 'package:expense/View/payslip/payroll_components_screen.dart';
import 'package:expense/bottom_bar_screen.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:expense/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../View/ErrorScreen/error_state_1.dart';
import '../View/Expense/expense_screen.dart';

import '../View/letters_screen/letter_requests_screen.dart';
import '../View/notification/notification_screen.dart';

import 'color_helper.dart';

class Global {
  DrawerGetController drawerGetController = Get.put(DrawerGetController());

  commonDrawer(
      {required BuildContext context,
      required Size size,
      required GlobalKey<ScaffoldState> key}) {
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.01,
          left: size.width * 0.04,
          right: size.width * 0.04),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Iconsax.close_circle,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            children: [
              Container(
                  height: size.height * 0.085,
                  width: size.height * 0.085,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: Colors.white,
                      border:
                          Border.all(color: Color(0xffFFC091), width: 0.5.w),
                      image: DecorationImage(
                          image: AssetImage("assets/images/profile.png"),
                          fit: BoxFit.cover))),
              SizedBox(
                width: size.width * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Inez Nuenez", style: TextStyleHelper.kWhite22W700Inter),
                  Text("Ui/Ux Designer",
                      style: TextStyleHelper.kWhite14W400Inter),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: size.width,
            height: size.height * 0.065,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.r),
              color: Color.fromRGBO(255, 255, 255, 0.14),
            ),
            child: TabBar(
              controller: drawerGetController.controller,
              physics: const NeverScrollableScrollPhysics(),
              onTap: (value) {
                drawerGetController.index == 0
                    ? drawerGetController.updateValue(1)
                    : drawerGetController.updateValue(0);
              },
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Color.fromRGBO(255, 192, 145, 0.24),
                  border: Border.all(color: Color(0xffFFC091))),
              indicatorPadding: EdgeInsets.all(size.height * 0.008),
              tabs: [
                Text(
                  'Personal',
                  style: TextStyleHelper.kPrimary14W600Inter,
                ),
                Text(
                  'Manager',
                  style: TextStyleHelper.kPrimary14W600Inter,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Divider(
            thickness: size.height * 0.001,
            color: Color(0xff868685),
          ),
          Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: drawerGetController.controller,
                children: [commonPersonal(size), commonManager(size)]),
          ),
        ],
      ),
    );
  }

  Widget RowData({
    IconData? icon,
    String? title,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 23),
          SizedBox(
            width: 15.w,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "$title",
              style: TextStyleHelper.kWhite16W600Inter,
            ),
          ),
          Spacer(),
          Icon(Iconsax.arrow_circle_right, color: Color(0xff868685), size: 18),
        ],
      ),
    );
  }

  commonPersonal(Size size) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          RowData(
              onTap: () {
                // Get.to(() => BottomBarScreen());
              },
              title: "Home",
              icon: Iconsax.home),
          SizedBox(
            height: size.height * 0.03,
          ),
          RowData(title: "Announcements", icon: Iconsax.message_text),
          SizedBox(
            height: size.height * 0.03,
          ),
          RowData(title: "Surveys", icon: Iconsax.emoji_happy),
          SizedBox(
            height: size.height * 0.02,
          ),
          Divider(
            thickness: size.height * 0.001,
            color: Color.fromRGBO(255, 255, 255, 0.14),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              Text("MY BENEFITS", style: TextStyleHelper.kWhite10W700Inter),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RowData(title: "Health Services", icon: Iconsax.health),
          SizedBox(
            height: size.height * 0.03,
          ),
          RowData(title: "Perks", icon: Iconsax.gift),
          SizedBox(
            height: size.height * 0.02,
          ),
          Divider(
            thickness: size.height * 0.001,
            color: Color.fromRGBO(255, 255, 255, 0.14),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              Text("WORK", style: TextStyleHelper.kWhite10W700Inter),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RowData(title: "Attendence", icon: Iconsax.calendar_tick),
          SizedBox(
            height: size.height * 0.03,
          ),
          RowData(title: "My pay", icon: Iconsax.wallet_money),
          SizedBox(
            height: size.height * 0.03,
          ),
          RowData(title: "Leaves", icon: Iconsax.setting_24),
          SizedBox(
            height: size.height * 0.03,
          ),
          RowData(title: "Work expenses", icon: Iconsax.receipt_text),
          SizedBox(
            height: size.height * 0.03,
          ),
          RowData(title: "Loan requests", icon: Iconsax.folder_open),
          SizedBox(
            height: size.height * 0.03,
          ),
          RowData(title: "Letter Requests", icon: Iconsax.folder_open),
          SizedBox(
            height: size.height * 0.02,
          ),
          Divider(
            thickness: size.height * 0.001,
            color: Color.fromRGBO(255, 255, 255, 0.14),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RowData(title: "Settings", icon: Iconsax.setting_24),
          SizedBox(
            height: size.height * 0.03,
          ),
          RowData(title: "Suggest a feature", icon: Iconsax.information),
          SizedBox(
            height: size.height * 0.03,
          ),
          RowData(title: "Logout", icon: Iconsax.logout),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }

  commonManager(Size size) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        RowData(title: "Leave Requests", icon: Iconsax.receipt_square),
        SizedBox(
          height: size.height * 0.03,
        ),
        RowData(title: "Attendence Daily Report", icon: Iconsax.calendar_tick),
        SizedBox(
          height: size.height * 0.03,
        ),
        RowData(title: "Kiosk mode", icon: Iconsax.scan_barcode),
        SizedBox(
          height: size.height * 0.03,
        ),
        RowData(title: "Work expenses", icon: Iconsax.receipt_text),
        Spacer(),
        Divider(
          thickness: size.height * 0.001,
          color: Color.fromRGBO(255, 255, 255, 0.14),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        RowData(title: "Settings", icon: Iconsax.setting_24),
        SizedBox(
          height: size.height * 0.03,
        ),
        RowData(title: "Suggest a feature", icon: Iconsax.information),
        SizedBox(
          height: size.height * 0.03,
        ),
        RowData(title: "Logout", icon: Iconsax.logout),
        SizedBox(
          height: size.height * 0.03,
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
