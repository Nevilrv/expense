import 'dart:developer';

import 'package:blur/blur.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constant/color_helper.dart';
import '../../constant/common_widget.dart';
import 'request_time_off_screen.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> leavesList = [
    {
      "day": '14',
      "name": "Sick\nLeaves",
    },
    {
      "day": "22",
      "name": "Casual\nLeaves",
    },
    {
      "day": "42",
      "name": "Medical\nLeaves",
    }
  ];

  List<Map<String, dynamic>> leveRequestList = [
    {
      "day": '4 Jan 2023 - 4 Feb 2023',
      "name": "Sick Leave",
      "icon": "assets/icons/tick-circle_green.svg",
      "color": Colors.green,
    },
    {
      "day": "4 Jan 2023 - 4 Feb 2023",
      "name": "Sick Leave",
      "icon": "assets/icons/tick-circle_green.svg",
      "color": Colors.green,
    },
    {
      "day": "4 Jan 2023 - 4 Feb 2023",
      "name": "Sick Leave",
      "icon": "assets/icons/close-circle.svg",
      "color": Colors.red,
    },
  ];

  List<Map<String, dynamic>> bottomBarList = [
    {
      "icon": "assets/icons/home.svg",
      "name": "Home",
    },
    {
      "icon": "assets/icons/Leave.svg",
      "name": "Leaves",
    },
    {
      "icon": "assets/icons/wallet-money.svg",
      "name": "Wallet",
    },
    {
      "icon": "assets/icons/clipboard-text.svg",
      "name": "Clipboard",
    }
  ];

  int bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.kBG,
        key: _scaffoldKey,
        drawer: Drawer(
          child: Global()
              .commonDrawer(context: context, size: size, key: _scaffoldKey),
        ),
        body: Stack(
          children: [
            Positioned(
              top: size.height * 0.3,
              left: 0,
              // right: size.width * 0.9,
              child: Image.asset(
                'assets/icons/halfcircle.png',
                height: 300,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: size.height * 0.2,
              left: size.width * 0.8,
              child: RotatedBox(
                quarterTurns: 3,
                child: Image.asset(
                  'assets/icons/Sales.png',
                  height: 300,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.7,
              left: size.width * 0.8,
              child: RotatedBox(
                quarterTurns: 4,
                child: Image.asset(
                  'assets/icons/Finance.png',
                  height: size.height * 0.3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                color: ColorHelper.kPrimary,
                                size: 24,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.35,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Leaves',
                                style: TextStyleHelper.kPrimary22W600Inter
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        Row(
                          children: [
                            Row(
                              children:
                                  List.generate(leavesList.length, (index) {
                                log('leavesList.length---------->>>>>> ${leavesList.length}');
                                return Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.110,
                                      width: size.width * 0.25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff2F2D29)
                                            .withOpacity(0.25),
                                        border: Border.all(
                                          color: ColorHelper.fontColor,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              leavesList[index]['day'],
                                              style: TextStyleHelper
                                                  .kPrimary22W600Inter,
                                            ),
                                            Text(
                                              leavesList[index]['name'],
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: TextStyleHelper
                                                  .kPrimary22W600Inter
                                                  .copyWith(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                );
                              }),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.012),
                              child: Container(
                                height: size.height * 0.040,
                                width: size.width * 0.09,
                                decoration: const BoxDecoration(
                                    color: Color(0xffFFC091),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(255, 122, 0, 0.35),
                                          blurRadius: 8,
                                          spreadRadius: 4),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/arrow-circle-right.svg',
                                      height: 25,
                                      color: ColorHelper.fontColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.020,
                        ),
                        Container(
                          height: size.height * 0.32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: ColorHelper.fontColor),
                          ),
                          child: Blur(
                            blur: 10,
                            colorOpacity: 0.25,
                            overlay: Padding(
                              padding: const EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Pending Leave Request',
                                          style: TextStyleHelper
                                              .kPrimary22W600Inter
                                              .copyWith(color: Colors.white),
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/arrow-circle-up.svg',
                                          height: 28,
                                          color: ColorHelper.kPrimary,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.020,
                                    ),
                                    Container(
                                      height: size.height * 0.17,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white.withOpacity(0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Sick Leave",
                                              style: TextStyleHelper
                                                  .kPrimary22W600Inter
                                                  .copyWith(fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.005,
                                            ),
                                            Text(
                                              "4 Jan 2023 - 4 Feb 2023",
                                              style: TextStyleHelper
                                                  .kPrimary22W600Inter
                                                  .copyWith(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.010,
                                            ),
                                            const Divider(
                                              height: 0,
                                              thickness: 0,
                                              color: Color(0xffF7F6F5),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.010,
                                            ),
                                            Text(
                                              "Reason".toUpperCase(),
                                              style: TextStyleHelper
                                                  .kPrimary22W600Inter
                                                  .copyWith(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.010,
                                            ),
                                            Text(
                                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                              textAlign: TextAlign.center,
                                              style: TextStyleHelper
                                                  .kPrimary22W600Inter
                                                  .copyWith(
                                                      fontSize: 10,
                                                      color: const Color(
                                                          0xffF7F6F5),
                                                      fontWeight:
                                                          FontWeight.w200),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.020,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "View more",
                                          style: TextStyleHelper
                                              .kPrimary22W600Inter
                                              .copyWith(fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.020,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/arrow-circle-right.svg',
                                          height: 17,
                                          color: ColorHelper.kPrimary,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(30),
                            blurColor: ColorHelper.kBGBlur,
                            child: Container(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.020,
                        ),
                        Container(
                          height: size.height * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: ColorHelper.fontColor),
                          ),
                          child: Blur(
                            blur: 10,
                            colorOpacity: 0.25,
                            overlay: Padding(
                              padding: const EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Leave Request History',
                                          style: TextStyleHelper
                                              .kPrimary22W600Inter
                                              .copyWith(color: Colors.white),
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/arrow-circle-up.svg',
                                          height: 28,
                                          color: ColorHelper.kPrimary,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.020,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: leveRequestList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Container(
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.14),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.width * 0.040,
                                                    vertical:
                                                        size.height * 0.015),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.62,
                                                              child: Text(
                                                                leveRequestList[
                                                                        index]
                                                                    ['name'],
                                                                overflow:
                                                                    TextOverflow
                                                                        .clip,
                                                                style: TextStyleHelper
                                                                    .kPrimary22W600Inter
                                                                    .copyWith(
                                                                        fontSize:
                                                                            15),
                                                              ),
                                                            ),
                                                            Text(
                                                              leveRequestList[
                                                                  index]['day'],
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: TextStyleHelper
                                                                  .kPrimary22W600Inter
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        SvgPicture.asset(
                                                          leveRequestList[index]
                                                              ['icon'],
                                                          height: 25,
                                                          color:
                                                              leveRequestList[
                                                                      index]
                                                                  ["color"],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.020,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: size.height * 0.020,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "View more",
                                          style: TextStyleHelper
                                              .kPrimary22W600Inter
                                              .copyWith(fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.020,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/arrow-circle-right.svg',
                                          height: 17,
                                          color: ColorHelper.kPrimary,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(30),
                            blurColor: ColorHelper.kBGBlur,
                            child: Container(),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        top: size.height * 0.8,
                        left: size.width * 0.75,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const RequestTimeOffScreen());
                          },
                          child: Image.asset(
                            'assets/icons/floating_button.png',
                            height: 69,
                            width: 69,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
