import 'dart:developer';
import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:expense/View/Expense/expense_screen.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constant/text_style_helper.dart';

class RequestLetterScreens extends StatefulWidget {
  const RequestLetterScreens({Key? key}) : super(key: key);

  @override
  State<RequestLetterScreens> createState() => _RequestLetterScreensState();
}

class _RequestLetterScreensState extends State<RequestLetterScreens> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _controller = PageController();

  List<String> requests = [
    'NOC Release Letter',
    'Passport Letter',
    'Salary Transfer Letter',
    'Experience Letter',
    'Other'
  ];

  int selectPage = 0;
  List scroll = [0];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorHelper.fontColor,
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
                  overlay: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: SvgPicture.asset(
                                'assets/icons/arrow-left-rounded.svg',
                                height: 35,
                              ),
                            ),
                            Text(
                              'Request Letter',
                              style: TextStyleHelper.kPrimary22W600Inter,
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
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Expanded(
                        child: PageView(
                          controller: _controller,
                          onPageChanged: (index) {
                            log('index---------->>>>>> ${index}');
                            selectPage = index;
                            if (scroll.contains(selectPage)) {
                              print('CONTAIN');
                            } else {
                              scroll.add(selectPage);
                            }
                            if (scroll.last > selectPage) {
                              scroll.remove(scroll.last);

                              print('REMOVE DATA $scroll');
                            }
                            setState(() {});
                          },
                          children: [
                            firstPage(size),
                            secondPage(size),
                            thirdPage(size),
                          ],
                        ),
                      ),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  blurColor: ColorHelper.kBGBlur,
                  child: Container(),
                ),
              ),
            ),
            Positioned(
                bottom: size.height * 0.030,
                left: size.width / 2.5,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Row(
                      children: [
                        scroll.contains(index)
                            ? Image.asset(
                                "assets/icons/circle_pageview.png",
                                height: 21,
                                width: 21,
                              )
                            : Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white)),
                              ),
                        SizedBox(
                          width: size.width * 0.015,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  firstPage(Size size) {
    return Column(
      children: [
        Text(
          'What type of Letter do you want to request?',
          style: TextStyleHelper.kWhite18W600Inter,
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: requests.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.036,
                  vertical: size.height * 0.011),
              child: Container(
                height: size.height * 0.078,
                width: size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.044,
                    ),
                    Text(
                      requests[index],
                      style: TextStyleHelper.kPrimary16W600Inter,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  secondPage(Size size) {
    return Column(
      children: [
        Text(
          'Select a date of issue for the letter',
          style: TextStyleHelper.kWhite18W600Inter,
        ),
      ],
    );
  }

  thirdPage(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Enter your name and address',
              style: TextStyleHelper.kWhite18W600Inter,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/user.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/address.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address #1',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/address.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address #2',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Country',
                style: TextStyleHelper.kWhite18W600Inter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/map.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Country',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/map.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'City',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/remarks.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Remark',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Reason/Notes',
                style: TextStyleHelper.kWhite18W600Inter,
              ),
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: TextStyleHelper.kWhite14W400Inter,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your reason here...',
                          hintStyle: TextStyleHelper.kWhite14W400Inter),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  generalDialog();
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: size.width / 1.5,
                  decoration: BoxDecoration(
                    color: ColorHelper.kPrimary,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0.0, 4.0))
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Text(
                    'Submit Request',
                    style: TextStyleHelper.kBG18W600Inter,
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Future generalDialog() {
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
                    "Letter Request Submitted",
                    style: TextStyleHelper.kWhite22W600Inter,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Flexible(
                    child: Text(
                      "Request for the required letter has been submitted successfully",
                      textAlign: TextAlign.center,
                      style: TextStyleHelper.kWhite16W400Inter,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
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
