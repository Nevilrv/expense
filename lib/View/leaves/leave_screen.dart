import 'dart:developer';
import 'dart:ui';
import 'package:expense/Controller/drawer_controller.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool expansionChanges = true;
  bool expansionChanges1 = true;
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
    },
    {
      "day": '62',
      "name": "Travel\nLeaves",
    },
    {
      "day": "90",
      "name": "Long\nLeaves",
    },
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
  DrawerGetController drawerGetController = Get.put(DrawerGetController());

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.kBG,
        key: _scaffoldKey,
        onDrawerChanged: (val) {
          drawerGetController.setDrawer(val);
          log("isDrawer---${drawerGetController.isDrawer}");
        },
        appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.057),
          child: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: size.height * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text(
                  'Leaves',
                  style: TextStyleHelper.kPrimary22W600Inter
                      .copyWith(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const RequestTimeOffScreen());
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/People.png',
                          ),
                          fit: BoxFit.cover),
                    ),
                    child:
                        const Icon(Icons.add_circle_outline_outlined, size: 17),
                  ),
                )
              ],
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: ColorHelper.kBG.withOpacity(0.9),
          child: Global()
              .commonDrawer(context: context, size: size, key: _scaffoldKey),
        ),
        body: SizedBox(
          height: size.height,
          child: Stack(
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
                              Expanded(
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  child: Row(
                                    children: List.generate(leavesList.length,
                                        (index) {
                                      return Row(
                                        children: [
                                          Container(
                                            height: size.height * 0.110,
                                            width: size.width * 0.25,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: const Color(0xff2F2D29)
                                                  .withOpacity(0.25),
                                              border: Border.all(
                                                color: ColorHelper.fontColor,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                    textAlign: TextAlign.center,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyleHelper
                                                        .kWhite10W700Inter,
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
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: size.width * 0.012),
                                child: GestureDetector(
                                  onTap: () {
                                    scrollController.animateTo(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.bounceIn,
                                        scrollController
                                            .position.maxScrollExtent);
                                  },
                                  child: Container(
                                    height: size.height * 0.040,
                                    width: size.width * 0.09,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffFFC091),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  255, 122, 0, 0.35),
                                              blurRadius: 8,
                                              spreadRadius: 4),
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),

                          ///Pending Leave Request-------------
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Stack(children: [
                              Positioned.fill(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 4, sigmaY: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          ColorHelper.kBGBlur.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(30.r),
                                      border: Border.all(
                                          color: ColorHelper.fontColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                          dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: true,
                                        trailing: expansionChanges
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
                                          'Pending Leave Request',
                                          style: TextStyleHelper
                                              .kPrimary22W600Inter
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 20),
                                        ),
                                        onExpansionChanged: (bool value) {
                                          setState(() {
                                            expansionChanges = value;
                                          });
                                        },
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.020,
                                          ),
                                          Container(
                                            // height: size.height * 0.17,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Sick Leave",
                                                    style: TextStyleHelper
                                                        .kPrimary22W600Inter
                                                        .copyWith(
                                                            fontSize: 16.sp),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.005,
                                                  ),
                                                  Text(
                                                    "4 Jan 2023 - 4 Feb 2023",
                                                    style: TextStyleHelper
                                                        .kWhite12w500BOLDInter,
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
                                                        .kWhite10W700Inter,
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.010,
                                                  ),
                                                  Text(
                                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyleHelper
                                                        .kWhite10W400Inter,
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
                                                    .kPrimary12W500Inter,
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
                                          SizedBox(
                                            height: size.height * 0.010,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       'Pending Leave Request',
                                    //       style: TextStyleHelper
                                    //           .kPrimary22W600Inter
                                    //           .copyWith(color: Colors.white),
                                    //     ),
                                    //     SvgPicture.asset(
                                    //       'assets/icons/arrow-circle-up.svg',
                                    //       height: 28,
                                    //       color: ColorHelper.kPrimary,
                                    //     )
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),

                          ///leave request history------------

                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned.fill(
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: ColorHelper.kBGBlur
                                            .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        border: Border.all(
                                            color: ColorHelper.fontColor),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Theme(
                                    data: ThemeData(
                                        dividerColor: Colors.transparent),
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
                                        'Leave Request History',
                                        style: TextStyleHelper
                                            .kPrimary22W600Inter
                                            .copyWith(color: Colors.white),
                                      ),
                                      onExpansionChanged: (bool value) {
                                        setState(() {
                                          expansionChanges1 = value;
                                        });
                                      },
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.020,
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: leveRequestList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              children: [
                                                Container(
                                                  width: size.width,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.14),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                size.width *
                                                                    0.040,
                                                            vertical:
                                                                size.height *
                                                                    0.015),
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
                                                                        [
                                                                        'name'],
                                                                    overflow:
                                                                        TextOverflow
                                                                            .clip,
                                                                    style: TextStyleHelper
                                                                        .kPrimary16W600Inter,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      size.height *
                                                                          0.010,
                                                                ),
                                                                Text(
                                                                    leveRequestList[
                                                                            index]
                                                                        ['day'],
                                                                    overflow:
                                                                        TextOverflow
                                                                            .clip,
                                                                    style: TextStyleHelper
                                                                        .kWhite12W700Inter),
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            SvgPicture.asset(
                                                              leveRequestList[
                                                                      index]
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
                                          height: size.height * 0.0050,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "View more",
                                              style: TextStyleHelper
                                                  .kPrimary12W500Inter,
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
                                        SizedBox(
                                          height: size.height * 0.010,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
