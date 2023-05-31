import 'dart:developer';
import 'package:expense/View/leaves/leave_screen.dart';
import 'package:expense/View/payslip/payslip_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'View/letters_screen/letter_requests_screen.dart';
import 'constant/color_helper.dart';
import 'constant/common_widget.dart';
import 'constant/text_style_helper.dart';
import 'home_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int bottomIndex = 0;

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
      "name": "Payslips",
    },
    {
      "icon": "assets/icons/clipboard-text.svg",
      "name": "Letters",
    }
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorHelper.kBG,
      key: _scaffoldKey,
      drawer: Drawer(
        child: Global()
            .commonDrawer(context: context, size: size, key: _scaffoldKey),
      ),
      body: Stack(
        children: [
          bottomIndex == 0
              ? const HomeScreen()
              : bottomIndex == 1
                  ? const LeaveScreen()
                  : bottomIndex == 2
                      ? const PaySlipScreen()
                      : const LetterRequestsScreen(),
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * 0.1997,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0),
                    ]),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.015,
            child: SizedBox(
              height: size.height * 0.08,
              width: size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: bottomBarList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              bottomIndex = index;
                            });

                            log('bottomIndex---------->>>>>> $bottomIndex');
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: bottomIndex == index
                                ? size.width * 0.40
                                : size.width * 0.165,
                            alignment: Alignment.center,
                            decoration: bottomIndex == index
                                ? BoxDecoration(
                                    color:
                                        ColorHelper.kPrimary.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: ColorHelper.kPrimary,
                                        width: 1.5))
                                : const BoxDecoration(
                                    color: Color(0xff6C6B6A),
                                    shape: BoxShape.circle,
                                  ),
                            child: bottomIndex == index
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.040),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          bottomBarList[index]['icon'],
                                          height: 32,
                                          color: ColorHelper.kPrimary,
                                        ),
                                        Text(
                                          bottomBarList[index]['name'],
                                          style: TextStyleHelper
                                              .kPrimary12W500Inter
                                              .copyWith(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        bottomBarList[index]['icon'],
                                        height: 32,
                                        color: Colors.white,
                                      ),
                                    ],
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
        ],
      ),
    );
  }
}
