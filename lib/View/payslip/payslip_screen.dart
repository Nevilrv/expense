import 'dart:ui';

import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constant/text_style_helper.dart';
import 'generate_payslip_screen.dart';

class PaySlipScreen extends StatefulWidget {
  const PaySlipScreen({Key? key}) : super(key: key);

  @override
  State<PaySlipScreen> createState() => _PaySlipScreenState();
}

class _PaySlipScreenState extends State<PaySlipScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> paySlipList = [
    {
      "day": "4 Jun - 4 Jul",
      "name": "Jan 2023",
      "icon": "assets/icons/arrow-circle-right.svg",
    },
    {
      "day": "4 Jun - 4 Jul",
      "name": "Feb 2023",
      "icon": "assets/icons/arrow-circle-right.svg",
    },
    {
      "day": "4 Jun - 4 Jul",
      "name": "Mar 2023",
      "icon": "assets/icons/arrow-circle-right.svg",
    },
    {
      "day": "4 Jun - 4 Jul",
      "name": "Apr 2023",
      "icon": "assets/icons/arrow-circle-right.svg",
    },
    {
      "day": "4 Jun - 4 Jul",
      "name": "May 2023",
      "icon": "assets/icons/arrow-circle-right.svg",
    },
    {
      "day": "4 Jun - 4 Jul",
      "name": "Jun 2023",
      "icon": "assets/icons/arrow-circle-right.svg",
    },
    {
      "day": "4 Jul - 4 Aug",
      "name": "Jul 2023",
      "icon": "assets/icons/arrow-circle-right.svg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorHelper.kBG,
        drawer: Drawer(
          child: Global()
              .commonDrawer(context: context, size: size, key: _scaffoldKey),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: size.height * 0.025,
            ),
            child: Row(
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
                  width: size.width * 0.33,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Payslip',
                    style: TextStyleHelper.kPrimary22W600Inter
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
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
                right: -size.width * 0.5,
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
                bottom: -size.height * 0.090,
                right: -size.width * 0.25,
                child: RotatedBox(
                  quarterTurns: 4,
                  child: Image.asset(
                    'assets/icons/Finance.png',
                    height: size.height * 0.3,
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 10,
              //     right: 10,
              //     top: size.height * 0.025,
              //   ),
              //   child: Row(
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           _scaffoldKey.currentState!.openDrawer();
              //         },
              //         child: Icon(
              //           Icons.menu,
              //           color: ColorHelper.kPrimary,
              //           size: 24,
              //         ),
              //       ),
              //       SizedBox(
              //         width: size.width * 0.33,
              //       ),
              //       Align(
              //         alignment: Alignment.center,
              //         child: Text(
              //           'Payslip',
              //           style: TextStyleHelper.kPrimary22W600Inter
              //               .copyWith(color: Colors.white),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 5),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: ColorHelper.kBGBlur.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(24.r)),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.030,
                                    left: size.width * 0.050,
                                    bottom: size.height * 0.010,
                                    right: size.width * 0.050),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/icons/arrow-circle-left.svg',
                                        height: 25,
                                      ),
                                    ),
                                    Text(
                                      '2023',
                                      style: TextStyleHelper.kWhite22W600Inter,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/icons/arrow-circle-right.svg',
                                        height: 25,
                                        color: Colors.white.withOpacity(0.14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                color: ColorHelper.kPrimary,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: paySlipList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.030),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(0.14),
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.040,
                                                vertical: size.height * 0.015),
                                            child: Column(
                                              children: [
                                                SingleChildScrollView(
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: size.width *
                                                                0.40,
                                                            child: Text(
                                                              paySlipList[index]
                                                                  ['name'],
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: TextStyleHelper
                                                                  .kWhite16W600Inter,
                                                            ),
                                                          ),
                                                          Text(
                                                            paySlipList[index]
                                                                ['day'],
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyleHelper
                                                                .kWhite12w500BOLDInter,
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height:
                                                            size.height * 0.045,
                                                        width:
                                                            size.width * 0.30,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                    0xffFFC091)
                                                                .withOpacity(
                                                                    0.14),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.r)),
                                                        child: Text(
                                                          "AED 20,000",
                                                          style: TextStyleHelper
                                                              .kWhite12w500BOLDInter,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.to(() =>
                                                              const GeneratePaySlipScreen());
                                                        },
                                                        child: SvgPicture.asset(
                                                          paySlipList[index]
                                                              ['icon'],
                                                          height: 25,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.020,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: size.height * 0.020,
                              ),
                            ],
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
