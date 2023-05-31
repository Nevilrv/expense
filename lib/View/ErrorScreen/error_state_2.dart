import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ErrorRequestScreen2 extends StatefulWidget {
  const ErrorRequestScreen2({Key? key}) : super(key: key);

  @override
  State<ErrorRequestScreen2> createState() => _ErrorRequestScreen2State();
}

class _ErrorRequestScreen2State extends State<ErrorRequestScreen2> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset(
                  'assets/icons/meetmax.png',
                  height: 63,
                  width: 220,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Error, please try again.',
                  style: TextStyleHelper.kWhite16W600Inter,
                ),
                const SizedBox(
                  height: 30,
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
                      'Try again',
                      style: TextStyleHelper.kBG18W600Inter,
                    )),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
