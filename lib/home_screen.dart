import 'dart:developer';

import 'package:blur/blur.dart';
import 'package:expense/Controller/drawer_controller.dart';
import 'package:expense/constant/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constant/color_helper.dart';
import 'constant/text_style_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DrawerGetController drawerGetController = Get.put(DrawerGetController());
  bool expansionChanges1 = true;
  List<Map<String, dynamic>> listView = [
    {
      "icon": Iconsax.wallet_money,
      "name": "LEAVE",
    },
    {
      "icon": Iconsax.clipboard_export,
      "name": "EXPENSE",
    },
    {
      "icon": Iconsax.document_download,
      "name": "LETTERS",
    },
    {
      "icon": Iconsax.wallet_money,
      "name": "PAYSLIPS",
    }
  ];

  List<Map<String, dynamic>> leveRequestList = [
    {
      "day": '4 Feb 2023',
      "name": "The Pods - Blue Waters",
      "icon": "10:21pm",
      "color": Colors.green,
    },
    {
      "day": "12 Feb 2023",
      "name": "The Pods - Blue Waters",
      "icon": "10:21am",
      "color": Colors.green,
    },
    {
      "day": "14 Feb 2023",
      "name": "The Pods - Blue Waters",
      "icon": "10:21pm",
      "color": Colors.red,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.kBG,
        onDrawerChanged: (val) {
          log("val----$val");
          drawerGetController.setDrawer(val);
          log("isDrawer---${drawerGetController.isDrawer}");
        },
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: ColorHelper.kBG.withOpacity(0.9),
          child: Global()
              .commonDrawer(context: context, size: size, key: _scaffoldKey),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: -size.height * 0.13,
                left: -size.width * 0.07,
                child: Stack(children: [
                  Image.asset(
                    'assets/icons/People.png',
                    height: 300,
                  ),
                  Positioned(
                    bottom: size.height * 0.18,
                    left: size.width * 0.12,
                    child: InkWell(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Icon(
                        Iconsax.menu_1,
                        color: ColorHelper.fontColor,
                        size: 25.h,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.115,
                    left: size.width * 0.12,
                    child: Text("hi, Inez",
                        style: TextStyleHelper.kfontColor22W700Inter),
                  ),
                  Positioned(
                      bottom: size.height * 0.06,
                      left: size.width * 0.12,
                      child: Container(
                        height: size.height * 0.045,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(51, 22, 0, 0.14),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.notification,
                                color: ColorHelper.fontColor,
                                size: 20,
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                "3",
                                style: TextStyleHelper.kfontColor16W600Inter,
                              )
                            ]),
                      )),
                ]),
              ),
              Positioned(
                top: size.height * 0.33,
                left: size.width * 0.77,
                child: Image.asset(
                  'assets/icons/Sales.png',
                  height: 250,
                ),
              ),
              Positioned(
                top: size.height * 0.6,
                right: size.width * 0.8,
                child: Image.asset(
                  'assets/icons/Finance.png',
                  height: size.height * 0.3,
                ),
              ),
              Positioned(
                top: size.height * 0.06,
                right: size.width * 0.065,
                child: Container(
                    width: size.height * 0.15,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(255, 192, 145, 0.2),
                              blurRadius: 50,
                              spreadRadius: 0.9,
                              offset: Offset(0.1, 0.8))
                        ],
                        image: const DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100.r))),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.26,
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      /*   Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        child: Container(
                          height: size.height * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color(0xffA8200D)),
                          ),
                          child: Blur(
                            blur: 10,
                            colorOpacity: 0.25,
                            overlay: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Icon(Iconsax.info_circle,
                                        color: Color(0xffA8200D), size: 60.h),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.020,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Device not connected to the Internet",
                                      style:
                                          TextStyleHelper.kPrimary16W600Inter,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.020,
                                  ),
                                  const Divider(
                                    height: 0,
                                    thickness: 2,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.020,
                                  ),
                                  Center(
                                    child: Text(
                                      "It seems like you are having internet\nconnectivity issues. Please check your\ninternet connection and try again.",
                                      style: TextStyleHelper.kWhite16W400Inter,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(30),
                            blurColor: ColorHelper.kBGBlur,
                            child: Container(),
                          ),
                        ),
                      ),*/
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        child: Container(
                          height: size.height * 0.29,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // border: Border.all(color: ColorHelper.fontColor),
                          ),
                          child: Blur(
                            blur: 10,
                            colorOpacity: 0.25,
                            overlay: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.020,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Scan QR Code to Clock-in",
                                      style:
                                          TextStyleHelper.kPrimary16W600Inter,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.020,
                                  ),
                                  const Divider(
                                    height: 0,
                                    thickness: 2,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.020,
                                  ),
                                  Text(
                                    "Please scan the QR code provided by your organization to clock-in to Max",
                                    style: TextStyleHelper.kWhite16W400Inter,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.020),
                                    child: Container(
                                      height: size.height * 0.06,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                        color: ColorHelper.kPrimary,
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(2, 0),
                                              blurRadius: 2,
                                              spreadRadius: 1,
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.2)),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: size.height * 0.050,
                                            width: size.width * 0.12,
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    33, 31, 29, 1),
                                                shape: BoxShape.circle),
                                            child: Center(
                                              child: Icon(Iconsax.timer_start,
                                                  color: ColorHelper.kPrimary),
                                            ),
                                          ),
                                          Spacer(),
                                          Align(
                                            child: Text(
                                              "Slide to Clock-In",
                                              style: TextStyleHelper
                                                  .kfontColor18W600Inter,
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                              height: size.height * 0.050,
                                              width: size.width * 0.13,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Color.fromRGBO(
                                                        33, 31, 29, 1),
                                                    width: 2.3),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Iconsax.arrow_right_1,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(30),
                            blurColor: ColorHelper.kBGBlur,
                            child: Container(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: Container(
                          height: size.height * 0.12,
                          width: size.width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: ListView.builder(
                              itemCount: listView.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                log("listView.length--------------> ${listView.length}");
                                return Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.1,
                                      width: size.height * 0.1,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(47, 45, 41, 0.4),
                                        // color: Colors.red,
                                        // border: Border.all(
                                        //     color: ColorHelper.fontColor),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            listView[index]['icon'],
                                            size: 30.h,
                                            color: ColorHelper.kPrimary,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.005,
                                          ),
                                          Text(
                                            listView[index]['name'],
                                            style: TextStyleHelper
                                                .kWhite10W700Inter,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.020,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        child: Container(
                          height: expansionChanges1
                              ? size.height * 0.4
                              : size.height * 0.08,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(47, 45, 41, 0.4),
                            borderRadius: BorderRadius.circular(20.r),
                            //  border: Border.all(color: ColorHelper.fontColor),
                          ),
                          child: Theme(
                            data: ThemeData(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              trailing: expansionChanges1
                                  ? SvgPicture.asset(
                                      'assets/icons/arrow-circle-up.svg',
                                      height: 28,
                                      color: ColorHelper.kPrimary,
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/arrow-circle-down.svg',
                                      height: 28,
                                      color: ColorHelper.kPrimary,
                                    ),
                              title: Text(
                                'Activity',
                                style: TextStyleHelper.kPrimary22W600Inter
                                    .copyWith(color: Colors.white),
                              ),
                              onExpansionChanged: (bool value) {
                                setState(() {
                                  expansionChanges1 = value;
                                });
                              },
                              children: [
                                Divider(
                                  thickness: size.height * 0.002,
                                  color: Colors.black,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: leveRequestList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.05,
                                              vertical: size.height * 0.015),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                      radius: 23.r,
                                                      backgroundColor:
                                                          index.isOdd
                                                              ? ColorHelper
                                                                  .fontColor
                                                              : ColorHelper
                                                                  .kPrimary,
                                                      child: Icon(
                                                        index.isOdd
                                                            ? Iconsax
                                                                .timer_start
                                                            : Iconsax
                                                                .timer_pause,
                                                        color: index.isOdd
                                                            ? ColorHelper
                                                                .kPrimary
                                                            : ColorHelper
                                                                .fontColor,
                                                      )),
                                                  SizedBox(
                                                    width: size.width * 0.015,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.55,
                                                        child: Text(
                                                          leveRequestList[index]
                                                              ['name'],
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyleHelper
                                                              .kWhite16W600Inter,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.010,
                                                      ),
                                                      Text(
                                                          leveRequestList[index]
                                                              ['day'],
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyleHelper
                                                              .kgrey12W500Inter),
                                                    ],
                                                  ),
                                                  Text(
                                                      leveRequestList[index]
                                                          ['icon'],
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyleHelper
                                                          .white14W600Inter),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: size.height * 0.020,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       "View more",
                                //       style:
                                //           TextStyleHelper.kPrimary12W500Inter,
                                //     ),
                                //     SizedBox(
                                //       width: size.width * 0.020,
                                //     ),
                                //     SvgPicture.asset(
                                //       'assets/icons/arrow-circle-right.svg',
                                //       height: 17,
                                //       color: ColorHelper.kPrimary,
                                //     )
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
