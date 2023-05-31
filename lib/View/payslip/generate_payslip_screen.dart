import 'dart:ui';
import 'package:expense/View/payslip/payroll_components_screen.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GeneratePaySlipScreen extends StatefulWidget {
  const GeneratePaySlipScreen({Key? key}) : super(key: key);

  @override
  State<GeneratePaySlipScreen> createState() => _GeneratePaySlipScreenState();
}

class _GeneratePaySlipScreenState extends State<GeneratePaySlipScreen> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorHelper.kBG,
      appBar: AppBar(
        backgroundColor: ColorHelper.kBG,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
            child: Container(
              height: size.height * 0.035,
              width: size.width * 0.20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ColorHelper.kPrimary, shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/arrow-left-rounded.svg',
                    height: 25,
                    color: ColorHelper.fontColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          '<Month> 2023',
          style: TextStyleHelper.kWhite22W600Inter,
        ),
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
              quarterTurns: 4,
              child: Image.asset(
                'assets/icons/Sales.png',
                height: 300,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
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
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 5),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            color: ColorHelper.kBGBlur.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(24)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(size.width * 0.025),
                    padding: EdgeInsets.all(size.width * 0.025),
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 90,
                          lineWidth: 5.0,
                          percent: 0.35,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Aed 20,500",
                                style: TextStyleHelper.kPrimary14W400Inter
                                    .copyWith(fontSize: 16),
                              ),
                              Text(
                                "Net Pay",
                                style: TextStyleHelper.kWhite12w500BOLDInter
                                    .copyWith(
                                        fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          backgroundColor: const Color(0xff8BFFA3),
                          progressColor: const Color(0xffFF6460),
                        ),
                        SizedBox(
                          height: size.height * 0.020,
                        ),
                        Container(
                          height: size.height * 0.115,
                          width: size.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "AED 20,000",
                                  style: TextStyleHelper.kWhite16W600Inter
                                      .copyWith(
                                          fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(
                                  height: size.height * 0.005,
                                ),
                                SizedBox(
                                  height: size.height * 0.005,
                                ),
                                Container(
                                  height: 3,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: ColorHelper.kPrimary,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(
                                  height: size.height * 0.005,
                                ),
                                Text(
                                  "Gross Pay",
                                  style: TextStyleHelper.kWhite12w500BOLDInter
                                      .copyWith(
                                          fontSize: 14, color: Colors.white),
                                ),
                                SizedBox(
                                  height: size.height * 0.010,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.020,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: size.height * 0.115,
                              width: size.width * 0.40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "AED 900",
                                      style: TextStyleHelper.kWhite16W600Inter
                                          .copyWith(
                                              fontSize: 12,
                                              color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    Container(
                                      height: 3,
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffA0E5AE),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    Text(
                                      "Additions",
                                      style: TextStyleHelper
                                          .kWhite12w500BOLDInter
                                          .copyWith(
                                              fontSize: 14,
                                              color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.010,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: size.height * 0.115,
                              width: size.width * 0.40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "AED 400",
                                      style: TextStyleHelper.kWhite16W600Inter
                                          .copyWith(
                                              fontSize: 12,
                                              color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    Container(
                                      height: 3,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFFBFBD),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    Text(
                                      "Deductions",
                                      style: TextStyleHelper
                                          .kWhite12w500BOLDInter
                                          .copyWith(
                                              fontSize: 12,
                                              color: Colors.white),
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
                        SizedBox(
                          height: size.height * 0.020,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => const PayrollComponentScreen());
                              },
                              child: Text(
                                "View Payroll Components",
                                style: TextStyleHelper.kPrimary22W600Inter
                                    .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                              ),
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
                          height: size.height * 0.020,
                        ),
                        isCheck == true
                            ? const SizedBox()
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    isCheck = true;
                                  });
                                },
                                child: Container(
                                  height: size.height * 0.057,
                                  width: size.width * 0.58,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ColorHelper.kPrimary,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    'Generate Payslip',
                                    style: TextStyleHelper.kWhite12w500BOLDInter
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: const Color(0xff331600)),
                                  ),
                                ),
                              ),
                        isCheck == true
                            ? Container(
                                height: size.height * 0.18,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.14),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/color_pdf_icon.svg',
                                      height: 55,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/share.svg',
                                          height: 15,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/import.svg',
                                          height: 15,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/eye.svg',
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(
                                      'Harry Carmine - Jan 2022 - Payslip.pdf',
                                      style: TextStyleHelper.kWhite14W400Inter,
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
