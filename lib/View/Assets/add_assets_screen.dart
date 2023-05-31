import 'dart:ui';
import 'package:blur/blur.dart';
import 'package:expense/Controller/add_assets_controller.dart';
import 'package:expense/View/Expense/expense_screen.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constant/color_helper.dart';

class AddAssets extends StatefulWidget {
  const AddAssets({Key? key}) : super(key: key);

  @override
  State<AddAssets> createState() => _AddAssetsState();
}

class _AddAssetsState extends State<AddAssets> {
  String? dropDownValue;

  AddAssetsController addAssetsController = Get.put(AddAssetsController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<AddAssetsController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorHelper.kBG,
            body: SingleChildScrollView(
              child: Stack(
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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: size.height * 0.05136),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Stack(clipBehavior: Clip.none, children: [
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 5),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                  color: ColorHelper.kBGBlur.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(24.r)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(size.width * 0.025),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14, bottom: 14, top: 7),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      Text(
                                        'Request Asset',
                                        style:
                                            TextStyleHelper.kPrimary20W600Inter,
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
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Form(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ///Assignment Date
                                        Text(
                                          'Assignment Date',
                                          style:
                                              TextStyleHelper.kWhite18W600Inter,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        Container(
                                          height: 50,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/calendar.svg',
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                  DateFormat.yMd().format(
                                                      controller.expenseDate),
                                                  style: TextStyleHelper
                                                      .kWhite14W400Inter),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () async {
                                                  controller.pickAssignmentDate(
                                                      context);
                                                },
                                                child: SvgPicture.asset(
                                                  'assets/icons/arrow-circle-down.svg',
                                                  height: 22,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 16,
                                        ),

                                        ///Process Type
                                        Text(
                                          'Process Type',
                                          style:
                                              TextStyleHelper.kWhite18W600Inter,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 50,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: DropdownButton(
                                                  dropdownColor:
                                                      ColorHelper.kBG,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                  underline: const SizedBox(),
                                                  icon: SvgPicture.asset(
                                                    'assets/icons/arrow-circle-down.svg',
                                                    height: 22,
                                                    color: Colors.white,
                                                  ),
                                                  hint: Row(
                                                    children: [
                                                      Text(
                                                          dropDownValue == null
                                                              ? 'Select'
                                                              : dropDownValue!,
                                                          style: TextStyleHelper
                                                              .kWhite14W400Inter),
                                                    ],
                                                  ),
                                                  isExpanded: true,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  items: [
                                                    'New',
                                                    'Acquisition',
                                                    'Operation',
                                                    'Maintenance',
                                                    'Renewal',
                                                  ].map(
                                                    (value) {
                                                      return DropdownMenuItem(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    },
                                                  ).toList(),
                                                  onChanged: (value1) {
                                                    setState(
                                                      () {
                                                        dropDownValue = value1;
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 16,
                                        ),

                                        ///Receipt Number
                                        Text(
                                          'Serial Number',
                                          style:
                                              TextStyleHelper.kWhite18W600Inter,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 50,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: TextFormField(
                                                  cursorColor: Colors.white,
                                                  style: TextStyleHelper
                                                      .kWhite14W400Inter,
                                                  decoration:
                                                      const InputDecoration(
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

                                        ///Asset Type
                                        Text(
                                          'Asset Type',
                                          style:
                                              TextStyleHelper.kWhite18W600Inter,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 50,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: TextFormField(
                                                  cursorColor: Colors.white,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyleHelper
                                                      .kWhite14W400Inter,
                                                  decoration:
                                                      const InputDecoration(
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

                                        ///Make
                                        Text(
                                          'Make',
                                          style:
                                              TextStyleHelper.kWhite18W600Inter,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        Container(
                                          height: 50,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: TextFormField(
                                                  cursorColor: Colors.white,
                                                  style: TextStyleHelper
                                                      .kWhite14W400Inter,
                                                  decoration:
                                                      const InputDecoration(
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

                                        ///Model
                                        Text(
                                          'Model',
                                          style:
                                              TextStyleHelper.kWhite18W600Inter,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            controller.pickModelDate(context);
                                          },
                                          child: Container(
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            width: size.width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30.r),
                                                border: Border.all(
                                                    color: Colors.white)),
                                            child: Row(
                                              children: [
                                                Text(
                                                    DateFormat.yMd().format(
                                                        controller
                                                            .reimbursementDate),
                                                    style: TextStyleHelper
                                                        .kWhite14W400Inter),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),

                                        ///Remarks
                                        Text(
                                          'Remarks',
                                          style:
                                              TextStyleHelper.kWhite18W600Inter,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 120,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Flexible(
                                                child: TextFormField(
                                                  cursorColor: Colors.white,
                                                  style: TextStyleHelper
                                                      .kWhite14W400Inter,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Enter your remarks ',
                                                      hintStyle: TextStyleHelper
                                                          .kWhite14W400Inter),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: GestureDetector(
                                            onTap: () {
                                              generalDialog();
                                            },
                                            child: Container(
                                              height: 50,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              width: size.width / 1.5,
                                              decoration: BoxDecoration(
                                                color: ColorHelper.kPrimary,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.white
                                                          .withOpacity(0.25),
                                                      spreadRadius: 0,
                                                      blurRadius: 10,
                                                      offset: const Offset(
                                                          0.0, 4.0))
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(30.r),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Add Asset',
                                                  style: TextStyleHelper
                                                      .kBG18W600Inter,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
