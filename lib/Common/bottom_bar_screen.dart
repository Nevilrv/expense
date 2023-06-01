import 'dart:developer';

import 'package:expense/Common/common_widget.dart';
import 'package:expense/Controller/bottom_bar_controller.dart';
import 'package:expense/Controller/drawer_controller.dart';
import 'package:expense/View/leaves/leave_screen.dart';
import 'package:expense/View/payslip/payslip_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../Constant/color_helper.dart';
import '../Constant/text_style_helper.dart';
import '../View/letters_screen/letter_requests_screen.dart';

import '../home_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  DrawerGetController drawerGetController = Get.put(DrawerGetController());
  BottomBarController bottomBarController = Get.put(BottomBarController());

  List<Map<String, dynamic>> bottomBarList = [
    {
      "icon": Iconsax.home1,
      "icons": Iconsax.home,
      "name": "Home",
    },
    {
      "icon": "assets/icons/Leave.svg",
      "name": "Leaves",
    },
    {
      "icon": Iconsax.wallet_money,
      "name": "Payslips",
    },
    {
      "icon": Iconsax.clipboard_text,
      "name": "Letters",
    }
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    log("drawerGetController.isDrawer----${drawerGetController.isDrawer}");
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorHelper.kBG,
        onDrawerChanged: (val) {
          drawerGetController.setDrawer(val);
          log("isDrawer---${drawerGetController.isDrawer}");
        },
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: ColorHelper.kBG.withOpacity(0.9),
          child: Global()
              .commonDrawer(context: context, size: size, key: _scaffoldKey),
        ),
        body: Stack(children: [
          bottomBarController.bottomIndex == 0
              ? const HomeScreen()
              : bottomBarController.bottomIndex == 1
                  ? const LeaveScreen()
                  : bottomBarController.bottomIndex == 2
                      ? const PaySlipScreen()
                      : const LetterRequestsScreen(),
          GetBuilder<DrawerGetController>(
            builder: (controller) {
              return Positioned(
                bottom: 0,
                child: Visibility(
                  visible: controller.isDrawer == false ? true : false,
                  child: Container(
                    height: size.height * 0.15,
                    width: size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0),
                          ]),
                    ),
                  ),
                ),
              );
            },
          ),
          GetBuilder<DrawerGetController>(
            builder: (controller) {
              return Positioned(
                bottom: size.height * 0.01,
                child: Visibility(
                  visible: controller.isDrawer == false ? true : false,
                  child: SizedBox(
                    height: size.height * 0.08,
                    width: size.width,
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: bottomBarList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    bottomBarController.setBottomIndex(index);
                                  });

                                  log('bottomIndex---------->>>>>> ${bottomBarController.bottomIndex}');
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.01),
                                  child: Container(
                                    height: size.height * 0.058,
                                    width:
                                        bottomBarController.bottomIndex == index
                                            ? size.width * 0.35
                                            : size.height * 0.058,
                                    alignment: Alignment.center,
                                    decoration:
                                        bottomBarController.bottomIndex == index
                                            ? BoxDecoration(
                                                color: ColorHelper.kPrimary
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(30.r),
                                                border: Border.all(
                                                    color: ColorHelper.kPrimary,
                                                    width: 1.5))
                                            : const BoxDecoration(
                                                color: Color(0xff6C6B6A),
                                                shape: BoxShape.circle,
                                              ),
                                    child: bottomBarController.bottomIndex ==
                                            index
                                        ? Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.040),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                index == 1
                                                    ? SvgPicture.asset(
                                                        bottomBarList[index]
                                                            ['icon'],
                                                        height: 23.h,
                                                        color: ColorHelper
                                                            .kPrimary,
                                                      )
                                                    : Icon(
                                                        bottomBarList[index]
                                                            ['icon'],
                                                        size: 23.h,
                                                        color: ColorHelper
                                                            .kPrimary,
                                                      ),
                                                Text(
                                                  bottomBarList[index]['name'],
                                                  style: TextStyleHelper
                                                      .kPrimary12W500Inter
                                                      .copyWith(
                                                          fontSize: 17.sp),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              index == 0
                                                  ? Icon(
                                                      bottomBarList[index]
                                                          ['icons'],
                                                      size: 23.h,
                                                      color: Colors.white,
                                                    )
                                                  : index == 1
                                                      ? SvgPicture.asset(
                                                          bottomBarList[index]
                                                              ['icon'],
                                                          height: 23.h,
                                                          color: Colors.white,
                                                        )
                                                      : Icon(
                                                          bottomBarList[index]
                                                              ['icon'],
                                                          size: 23.h,
                                                          color: Colors.white,
                                                        ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ]));
  }
}
