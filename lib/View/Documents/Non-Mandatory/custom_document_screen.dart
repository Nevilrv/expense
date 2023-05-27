import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:expense/View/Expense/expense_screen.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomDocumentScreen extends StatefulWidget {
  const CustomDocumentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDocumentScreen> createState() => _CustomDocumentScreenState();
}

class _CustomDocumentScreenState extends State<CustomDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.kBG,
        body: Stack(
          children: [
            Positioned(
              top: size.height * 0.3,
              left: size.width * 0.8,
              child: Image.asset(
                'assets/icons/Sales.png',
                height: 250,
              ),
            ),
            Positioned(
              top: size.height * 0.75,
              right: size.width * 0.85,
              child: Image.asset(
                'assets/icons/Finance.png',
                height: size.height * 0.3,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: size.height * 1,
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.025, vertical: size.width * 0.08),
              child: Blur(
                blur: 10,
                colorOpacity: 0.25,
                overlay: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.036,
                        vertical: size.height * 0.011,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/icons/arrow-left-rounded.svg',
                              height: 35,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              'Custom Document',
                              style: TextStyleHelper.kPrimary20W600Inter,
                              overflow: TextOverflow.ellipsis,
                            ),
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
                      height: size.height * 0.027,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Title',
                                textAlign: TextAlign.justify,
                                style: TextStyleHelper.kWhite16W600Inter),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.white)),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      style: TextStyleHelper.kWhite14W400Inter,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text('Attach your Document',
                                textAlign: TextAlign.justify,
                                style: TextStyleHelper.kWhite16W600Inter),
                            const SizedBox(
                              height: 16,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: size.height * 0.052,
                                width: size.width * 0.547,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: ColorHelper.kPrimary),
                                  borderRadius: BorderRadius.circular(56),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/export.svg'),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Upload (Size Limit: 5MB)',
                                      style:
                                          TextStyleHelper.kPrimary12W500Inter,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text('Description',
                                textAlign: TextAlign.justify,
                                style: TextStyleHelper.kWhite16W600Inter),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.white)),
                              child: TextFormField(
                                cursorColor: Colors.white,
                                style: TextStyleHelper.kWhite14W400Inter,
                                minLines: 4,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 20,
                                  ),
                                  hintText:
                                      'Enter description about the document',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xffF7F6F5),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Inter-Normal'),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  generalDialog();
                                },
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                    'Add Asset',
                                    style: TextStyleHelper.kBG18W600Inter,
                                  )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
                blurColor: ColorHelper.kBGBlur,
                child: Container(),
              ),
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
                    "Request Successful",
                    style: TextStyleHelper.kWhite22W600Inter,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Asset request has been submitted\nsuccessfully",
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.kWhite16W400Inter,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ExpenseScreen(),
                          transition: Transition.rightToLeft);
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
