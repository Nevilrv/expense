import 'dart:developer';
import 'package:blur/blur.dart';
import 'package:expense/View/Expense/expense_screen.dart';
import 'package:expense/View/leaves/leave_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/color_helper.dart';
import '../../constant/common_widget.dart';
import '../../constant/text_style_helper.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;
  List<Map<String, dynamic>> recentList = [
    {
      "icon": "assets/icons/Leave.svg",
      "name": "Sally Requested a leave.",
      "icon2": "assets/icons/arrow-circle-right.svg",
      "time": "6:33 pm"
    },
    {
      "icon": "assets/icons/notification.svg",
      "name": "It seems you haven’t uploaded your mandatory documents.",
      "icon2": "assets/icons/arrow-circle-right.svg",
      "time": "5:15 pm"
    },
    {
      "icon": "assets/icons/Leave.svg",
      "name": "Ramsey Requested a leave.",
      "icon2": "assets/icons/arrow-circle-right.svg",
      "time": "6:33 pm"
    }
  ];
  List<Map<String, dynamic>> previousList = [
    {
      "icon": "assets/icons/Leave.svg",
      "name": "Sally Requested a leave.",
      "icon2": "assets/icons/arrow-circle-right.svg",
      "time": "6:33 pm"
    },
  ];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Global()
              .commonDrawer(context: context, size: size, key: _scaffoldKey),
        ),
        backgroundColor: ColorHelper.kBG,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              child: Container(
                height: size.height * 0.18,
                width: size.width * 0.32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/icons/circle.png",
                      ),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.030,
                    ),
                    InkWell(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.08),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.menu,
                            color: Color(0xff260A2F),
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.4,
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
              top: size.height * 0.60,
              right: size.width * 0.85,
              child: Image.asset(
                'assets/icons/Finance.png',
                height: size.height * 0.3,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.070),
              child: Container(
                height: size.height * 1.10,
                margin: EdgeInsets.all(size.width * 0.025),
                child: Blur(
                  blur: 10,
                  colorOpacity: 0.25,
                  overlay: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/arrow-left-rounded.svg',
                                  height: 35,
                                ),
                              ),
                              Text(
                                'Latest Updates',
                                style: TextStyleHelper.kPrimary20W600Inter,
                              ),
                              const SizedBox(width: 35),
                            ],
                          ),
                        ),
                        Divider(
                          height: 0,
                          thickness: 2,
                          color: ColorHelper.kPrimary,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.020,
                              ),
                              Container(
                                height: size.height * 0.040,
                                decoration: BoxDecoration(
                                    color: const Color(0xff2F2D29)
                                        .withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(8)),
                                child: TabBar(
                                  controller: _tabController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  onTap: (value) {
                                    setState(() {
                                      index = value;
                                    });
                                    log('value---------->>>>>> ${value}');
                                  },
                                  // give the indicator a decoration (color and border radius)
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xffFFC091),
                                      border: Border.all(color: Colors.white)),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.black,
                                  tabs: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/notification.svg',
                                          height: 20,
                                          color: index == 0
                                              ? ColorHelper.fontColor
                                              : const Color(
                                                  0xffF7F6F5,
                                                ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Notifications',
                                          style: TextStyleHelper
                                              .kPrimary20W600Inter
                                              .copyWith(
                                            fontSize: 14,
                                            color: index == 0
                                                ? ColorHelper.fontColor
                                                : const Color(
                                                    0xffF7F6F5,
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // second tab [you can add an icon using the icon property]
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/notification.svg',
                                          height: 20,
                                          color: index == 1
                                              ? ColorHelper.fontColor
                                              : const Color(
                                                  0xffF7F6F5,
                                                ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Announcements',
                                          style: TextStyleHelper
                                              .kPrimary20W600Inter
                                              .copyWith(
                                            fontSize: 14,
                                            color: index == 1
                                                ? ColorHelper.fontColor
                                                : const Color(
                                                    0xffF7F6F5,
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.020,
                              ),
                              const Divider(
                                height: 0,
                                thickness: 1,
                                color: Color(0xffF7F6F5),
                              ),
                              Container(
                                height: size.height * 0.68,
                                // color: Colors.red,
                                child: TabBarView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: _tabController,
                                    children: [
                                      // first tab bar view widget
                                      notificationMethod(size),
                                      announcementMethod(size),
                                    ]),
                              ),
                            ],
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
          ],
        ),
      ),
    );
  }

  notificationMethod(Size size) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.010,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.38,
              ),
              Text(
                'Recent',
                style: TextStyleHelper.kPrimary20W600Inter
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.020),
                child: SvgPicture.asset(
                  'assets/icons/arrow-circle-up.svg',
                  height: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.020,
          ),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: recentList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    // height: size.height * 0.120,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.14),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.040,
                          vertical: size.height * 0.015),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                recentList[index]['icon'],
                                height: 25,
                                color: const Color(0xffFFC091),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: size.width * 0.62,
                                child: Text(
                                  recentList[index]['name'],
                                  overflow: TextOverflow.clip,
                                  style: TextStyleHelper.kPrimary20W600Inter
                                      .copyWith(
                                          color: Colors.white, fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                recentList[index]['icon2'],
                                height: 25,
                                color: const Color(0xff868685),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          const Divider(
                            height: 0,
                            thickness: 1,
                            color: Color(0xffF7F6F5),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Row(
                            children: [
                              Text(
                                recentList[index]['time'],
                                overflow: TextOverflow.clip,
                                style: TextStyleHelper.kPrimary20W600Inter
                                    .copyWith(
                                        color: Colors.white, fontSize: 15),
                              ),
                              const Spacer(),
                              Container(
                                height: size.height * 0.037,
                                width: size.width * 0.20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFC091),
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Reject',
                                  overflow: TextOverflow.clip,
                                  style: TextStyleHelper.kPrimary20W600Inter
                                      .copyWith(fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Container(
                                height: size.height * 0.037,
                                width: size.width * 0.20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFC091),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Approve',
                                  overflow: TextOverflow.clip,
                                  style: TextStyleHelper.kPrimary20W600Inter
                                      .copyWith(
                                          fontSize: 15,
                                          color: ColorHelper.fontColor),
                                ),
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
          const Divider(
            height: 0,
            thickness: 1,
            color: Color(0xffF7F6F5),
          ),
          SizedBox(
            height: size.height * 0.020,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.38,
              ),
              Text(
                'Previous',
                style: TextStyleHelper.kPrimary20W600Inter
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.020),
                child: SvgPicture.asset(
                  'assets/icons/arrow-circle-up.svg',
                  height: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.020,
          ),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: previousList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    // height: size.height * 0.120,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.14),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.040,
                          vertical: size.height * 0.015),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                previousList[index]['icon'],
                                height: 25,
                                color: const Color(0xffFFC091),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: size.width * 0.62,
                                child: Text(
                                  previousList[index]['name'],
                                  overflow: TextOverflow.clip,
                                  style: TextStyleHelper.kPrimary20W600Inter
                                      .copyWith(
                                          color: Colors.white, fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                previousList[index]['icon2'],
                                height: 25,
                                color: const Color(0xff868685),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          const Divider(
                            height: 0,
                            thickness: 1,
                            color: Color(0xffF7F6F5),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Row(
                            children: [
                              Text(
                                previousList[index]['time'],
                                overflow: TextOverflow.clip,
                                style: TextStyleHelper.kPrimary20W600Inter
                                    .copyWith(
                                        color: Colors.white, fontSize: 15),
                              ),
                              const Spacer(),
                              Container(
                                height: size.height * 0.037,
                                width: size.width * 0.20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffFFC091),
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Reject',
                                  overflow: TextOverflow.clip,
                                  style: TextStyleHelper.kPrimary20W600Inter
                                      .copyWith(fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Container(
                                height: size.height * 0.037,
                                width: size.width * 0.20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFC091),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Approve',
                                  overflow: TextOverflow.clip,
                                  style: TextStyleHelper.kPrimary20W600Inter
                                      .copyWith(
                                          fontSize: 15,
                                          color: ColorHelper.fontColor),
                                ),
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
        ],
      ),
    );
  }

  announcementMethod(Size size) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.010,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * 0.38,
            ),
            Text(
              'Recent',
              style: TextStyleHelper.kPrimary20W600Inter
                  .copyWith(color: Colors.white, fontSize: 15),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.020),
              child: SvgPicture.asset(
                'assets/icons/arrow-circle-up.svg',
                height: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        Container(
          // height: size.height * 0.120,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.14),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.040, vertical: size.height * 0.015),
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.80,
                  child: Text(
                    'Dear Team,\n\nI am excited to share that we have successfully aunched\n our new product line and it is now available for customer use.\n Our team s hard work and dedication has made  possible\n and I couldn t be more proud of each and every one of you. ',
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.start,
                    style: TextStyleHelper.kPrimary20W600Inter.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                Row(
                  children: [
                    Text(
                      '12-02-2023',
                      overflow: TextOverflow.clip,
                      style: TextStyleHelper.kPrimary20W600Inter
                          .copyWith(fontSize: 15, color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      '8:56 pm',
                      overflow: TextOverflow.clip,
                      style: TextStyleHelper.kPrimary20W600Inter
                          .copyWith(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        const Divider(
          height: 0,
          thickness: 1,
          color: Color(0xffF7F6F5),
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * 0.38,
            ),
            Text(
              'Previous',
              style: TextStyleHelper.kPrimary20W600Inter
                  .copyWith(color: Colors.white, fontSize: 15),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.020),
              child: SvgPicture.asset(
                'assets/icons/arrow-circle-up.svg',
                height: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        Container(
          // height: size.height * 0.120,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.14),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.040, vertical: size.height * 0.015),
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.80,
                  child: Text(
                    'Eid mubarak to all meet max family',
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.start,
                    style: TextStyleHelper.kPrimary20W600Inter.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                Row(
                  children: [
                    Text(
                      '10-8-2022',
                      overflow: TextOverflow.clip,
                      style: TextStyleHelper.kPrimary20W600Inter
                          .copyWith(fontSize: 15, color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      '12:00 am',
                      overflow: TextOverflow.clip,
                      style: TextStyleHelper.kPrimary20W600Inter
                          .copyWith(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
