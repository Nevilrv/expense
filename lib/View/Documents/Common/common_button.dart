import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common_dialog.dart';

class CommonButton {
  saveButton(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          AddDocumentDialog().generalDialog();
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
              'Save',
              style: TextStyleHelper.kBG18W600Inter,
            ),
          ),
        ),
      ),
    );
  }
}
