import 'package:blur/blur.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constant/text_style_helper.dart';

class AddDocumentScreen extends StatefulWidget {
  const AddDocumentScreen({Key? key}) : super(key: key);

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
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
            padding: EdgeInsets.symmetric(horizontal: 10),
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
            padding: EdgeInsets.only(top: size.height * 0.020),
            child: Container(
              height: size.height * 1.10,
              margin: EdgeInsets.all(size.width * 0.025),
              child: Blur(
                blur: 10,
                colorOpacity: 0.25,
                overlay: Column(
                  children: [],
                ),
                borderRadius: BorderRadius.circular(30),
                blurColor: ColorHelper.kBGBlur,
                child: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
