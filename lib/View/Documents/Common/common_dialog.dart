import 'dart:ui';
import 'package:expense/View/Documents/add_document_screen.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddDocumentDialog {
  generalDialog() {
    return Get.generalDialog(
      barrierDismissible: true,
      barrierLabel: "",
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.1),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          contentPadding: const EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
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
                    "Upload Completed",
                    style: TextStyleHelper.kWhite22W600Inter,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Your document has been uploaded",
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.kWhite16W400Inter,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddDocumentScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 151,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorHelper.kPrimary,
                        borderRadius: BorderRadius.circular(56.r),
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
