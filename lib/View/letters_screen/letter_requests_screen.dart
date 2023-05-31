import 'dart:ui';

import 'package:expense/View/letters_screen/request_letter_screens.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constant/common_widget.dart';
import '../../constant/text_style_helper.dart';

class LetterRequestsScreen extends StatefulWidget {
  const LetterRequestsScreen({Key? key}) : super(key: key);

  @override
  State<LetterRequestsScreen> createState() => _LetterRequestsScreenState();
}

class _LetterRequestsScreenState extends State<LetterRequestsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool expansionChanges = true;
  bool expansionChanges1 = true;
  List<String> titles = [
    'NOC Release Letter',
    'Passport Letter',
    'Salary Transfer Letter'
  ];

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
        // appBar: PreferredSize(
        //     preferredSize: Size(size.width, size.height * 0.1),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         InkWell(
        //           onTap: () {
        //             _scaffoldKey.currentState!.openDrawer();
        //           },
        //           child: Padding(
        //             padding: EdgeInsets.only(
        //               left: size.width * 0.08,
        //             ),
        //             child: const Align(
        //               alignment: Alignment.centerLeft,
        //               child: Icon(
        //                 Icons.menu,
        //                 color: Color(0xff260A2F),
        //                 size: 24,
        //               ),
        //             ),
        //           ),
        //         ),
        //         const Text(
        //           'Letter Request',
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.w600,
        //               fontSize: 22),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.only(right: size.width * 0.08),
        //           child: GestureDetector(
        //             onTap: () {
        //               Get.to(() => const RequestLetterScreens());
        //             },
        //             child: Image.asset(
        //               'assets/icons/floating_button.png',
        //               height: 32,
        //               width: 32,
        //             ),
        //           ),
        //         ),
        //       ],
        //     )),
        backgroundColor: ColorHelper.kBG,
        body: SizedBox(
          height: size.height,
          child: Stack(
            clipBehavior: Clip.none,
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
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.077,
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.08,
                              ),
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
                          const Text(
                            'Letter Request',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: size.width * 0.08),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => const RequestLetterScreens());
                              },
                              child: Image.asset(
                                'assets/icons/floating_button.png',
                                height: 32,
                                width: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Stack(children: [
                              Positioned.fill(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          ColorHelper.kBGBlur.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
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
                                                color: ColorHelper.kPrimary,
                                                height: 21.5,
                                                width: 21.5,
                                              )
                                            : SvgPicture.asset(
                                                'assets/icons/arrow-circle-down.svg',
                                                color: ColorHelper.kPrimary,
                                                height: 21.5,
                                                width: 21.5,
                                              ),
                                        title: Text(
                                          'Pending Request',
                                          style:
                                              TextStyleHelper.kWhite22W600Inter,
                                        ),
                                        onExpansionChanged: (bool value) {
                                          setState(() {
                                            expansionChanges = value;
                                          });
                                        },
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: size.height * 0.018,
                                                horizontal: size.width * 0.04),
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                  size.height * 0.018),
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xFFFFFFFF)
                                                      .withOpacity(0.14),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'NOC Letter',
                                                    style: TextStyleHelper
                                                        .kPrimary16W600Inter,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.34,
                                                        child: Text(
                                                          'Submit Date',
                                                          style: TextStyleHelper
                                                              .kWhite14W400Inter,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.34,
                                                        child: Text(
                                                          '20/12/2023',
                                                          style: TextStyleHelper
                                                              .kWhite14W400Inter,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'View more  ',
                                                style: TextStyle(
                                                  color: ColorHelper.kPrimary,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Inter-Medium',
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                'assets/icons/arrow-circle-right.svg',
                                                color: ColorHelper.kPrimary,
                                                height: 14,
                                                width: 14,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
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
                            height: size.height * 0.02,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Stack(children: [
                              Positioned.fill(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          ColorHelper.kBGBlur.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Column(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                          dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: true,
                                        trailing: expansionChanges1
                                            ? SvgPicture.asset(
                                                'assets/icons/arrow-circle-up.svg',
                                                color: ColorHelper.kPrimary,
                                                height: 21.5,
                                                width: 21.5,
                                              )
                                            : SvgPicture.asset(
                                                'assets/icons/arrow-circle-down.svg',
                                                color: ColorHelper.kPrimary,
                                                height: 21.5,
                                                width: 21.5,
                                              ),
                                        title: Text(
                                          'Request History',
                                          style:
                                              TextStyleHelper.kWhite22W600Inter,
                                        ),
                                        onExpansionChanged: (bool value) {
                                          setState(() {
                                            expansionChanges1 = value;
                                          });
                                        },
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.009,
                                          ),
                                          ...List.generate(
                                            3,
                                            (index) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 10),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                width: size.width,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF)
                                                            .withOpacity(0.14),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.r)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                titles[index],
                                                                style: TextStyleHelper
                                                                    .kPrimary16W600Inter,
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.66,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Request Date',
                                                                      style: TextStyleHelper
                                                                          .kWhite14W400Inter,
                                                                    ),
                                                                    Text(
                                                                      '20/12/2023',
                                                                      style: TextStyleHelper
                                                                          .kWhite14W400Inter,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.66,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Issue Date',
                                                                      style: TextStyleHelper
                                                                          .kWhite14W400Inter,
                                                                    ),
                                                                    Text(
                                                                      '02/01/2023',
                                                                      style: TextStyleHelper
                                                                          .kWhite14W400Inter,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.66,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Approval Date',
                                                                      style: TextStyleHelper
                                                                          .kWhite14W400Inter,
                                                                    ),
                                                                    Text(
                                                                      '03/01/2023',
                                                                      style: TextStyleHelper
                                                                          .kWhite14W400Inter,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: size
                                                                            .width *
                                                                        0.21),
                                                                child: Text(
                                                                  'Download Attachment',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: ColorHelper
                                                                          .kPrimary,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Positioned(
                                                            left: size.width *
                                                                0.73,
                                                            top: -5,
                                                            child: SvgPicture
                                                                .asset(
                                                              index == 2
                                                                  ? 'assets/icons/close-circles.svg'
                                                                  : 'assets/icons/tick-circle_green.svg',
                                                              height: 28,
                                                              width: 28,
                                                              color: index == 2
                                                                  ? const Color(
                                                                      0xFfA8200D)
                                                                  : const Color(
                                                                      0xFf9FE870),
                                                            ),
                                                          )
                                                        ]),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.0159,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'View more  ',
                                                style: TextStyle(
                                                  color: ColorHelper.kPrimary,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Inter-Medium',
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                'assets/icons/arrow-circle-right.svg',
                                                color: ColorHelper.kPrimary,
                                                height: 14,
                                                width: 14,
                                              )
                                            ],
                                          )
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
                            height: size.height * 0.1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
