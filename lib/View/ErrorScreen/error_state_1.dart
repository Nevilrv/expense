import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'error_state_2.dart';

class ErrorRequestScreen1 extends StatefulWidget {
  const ErrorRequestScreen1({Key? key}) : super(key: key);

  @override
  State<ErrorRequestScreen1> createState() => _ErrorRequestScreen1State();
}

class _ErrorRequestScreen1State extends State<ErrorRequestScreen1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              top: size.height * 0.11,
              left: size.width * 0.75,
              child: Container(
                height: size.height * 0.28,
                width: size.width * 0.6,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/icons/People.png",
                      ),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.6,
              left: size.width * 0.75,
              child: RotatedBox(
                quarterTurns: 3,
                child: Image.asset(
                  'assets/icons/Sales.png',
                  height: 240,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.11,
              right: size.width * 0.75,
              child: Image.asset(
                'assets/icons/Finance.png',
                height: size.height * 0.34,
              ),
            ),
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: SvgPicture.asset(
                                'assets/icons/back.svg',
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.15,
                          ),
                          Text(
                            'Request a Letter',
                            style: TextStyleHelper.kWhite22W600Inter,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      SvgPicture.asset(
                        'assets/icons/emoji-sad.svg',
                        height: 46,
                        width: 46,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 30),
                        child: Text(
                          'Oops!',
                          style: TextStyleHelper.kWhite22W600Inter,
                        ),
                      ),
                      Text(
                        'Something wrong happened, if this error\npersists please contact your manager.',
                        textAlign: TextAlign.center,
                        style: TextStyleHelper.kWhite16W600Inter,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'We were unable to load the requested data.',
                          textAlign: TextAlign.center,
                          style: TextStyleHelper.kWhite14W400Inter,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const ErrorRequestScreen2(),
                          );
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
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                              child: Text(
                            'Retry',
                            style: TextStyleHelper.kBG18W600Inter,
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: size.width / 1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(
                                  color: ColorHelper.kPrimary, width: 1)),
                          child: Center(
                              child: Text(
                            'Go back',
                            style: TextStyleHelper.kBG18W600Inter
                                .copyWith(color: ColorHelper.kPrimary),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
