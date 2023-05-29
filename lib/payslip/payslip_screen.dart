import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constant/color_helper.dart';
import '../constant/common_widget.dart';
import '../constant/text_style_helper.dart';
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
      "name": "May 2023",
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
        appBar: AppBar(
          backgroundColor: ColorHelper.kBG,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: ColorHelper.kPrimary,
              size: 24,
            ),
          ),
          centerTitle: true,
          title: Text(
            'PaySlip',
            style: TextStyleHelper.kWhite22W600Inter,
          ),
        ),
        body: Container(
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
              Padding(
                padding: EdgeInsets.all(size.width * 0.025),
                child: Blur(
                  blur: 10,
                  colorOpacity: 0.25,
                  overlay: Container(
                    height: Get.height * 1.10,
                    margin: EdgeInsets.all(size.width * 0.025),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/arrow-circle-left.svg',
                                  height: 35,
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
                                  height: 35,
                                  color: Colors.white.withOpacity(0.14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
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
                            return Column(
                              children: [
                                Container(
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
                                        SingleChildScrollView(
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: size.width * 0.40,
                                                    child: Text(
                                                      paySlipList[index]
                                                          ['name'],
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyleHelper
                                                          .kPrimary22W600Inter
                                                          .copyWith(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                  Text(
                                                    paySlipList[index]['day'],
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyleHelper
                                                        .kPrimary22W600Inter
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: size.height * 0.045,
                                                width: size.width * 0.30,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffFFC091)
                                                        .withOpacity(0.14),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Text(
                                                  "AED 20,000",
                                                  style: TextStyleHelper
                                                      .kWhite14W400Inter,
                                                ),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      GeneratePaySlipScreen());
                                                },
                                                child: SvgPicture.asset(
                                                  paySlipList[index]['icon'],
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  borderRadius: BorderRadius.circular(30),
                  blurColor: ColorHelper.kBGBlur,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
