import 'dart:ui';

import 'package:expense/Controller/AddDocumentsController/visa_controller.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

import '../Common/common_button.dart';

class AddVisaScreen extends StatefulWidget {
  const AddVisaScreen({Key? key}) : super(key: key);

  @override
  State<AddVisaScreen> createState() => _AddVisaScreenState();
}

class _AddVisaScreenState extends State<AddVisaScreen> {
  String? dropDownValue;
  String? dropDownValue1;

  VisaController visaController = Get.put(VisaController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<VisaController>(
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
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.042,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Stack(clipBehavior: Clip.none, children: [
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 5),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                  color: ColorHelper.kBGBlur.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(24.r)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.025,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(13),
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
                                      'Visa',
                                      style:
                                          TextStyleHelper.kPrimary20W600Inter,
                                    ),
                                    const SizedBox(width: 35),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                child: Divider(
                                  height: 0,
                                  thickness: 2,
                                  color: ColorHelper.kPrimary,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Form(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ///First Name
                                      Text(
                                        'First Name',
                                        style: TextStyleHelper.white16W600Inter,
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
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style:
                                              TextStyleHelper.kWhite14W400Inter,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 16,
                                      ),

                                      ///last Name
                                      Text(
                                        'Last Name',
                                        style: TextStyleHelper.white16W600Inter,
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
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style:
                                              TextStyleHelper.kWhite14W400Inter,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 16,
                                      ),

                                      ///UID
                                      Text(
                                        'UID',
                                        style: TextStyleHelper.white16W600Inter,
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
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style:
                                              TextStyleHelper.kWhite14W400Inter,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 16,
                                      ),

                                      ///Visa File No.
                                      Text(
                                        'Visa File No.',
                                        style: TextStyleHelper.white16W600Inter,
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
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style:
                                              TextStyleHelper.kWhite14W400Inter,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 16,
                                      ),

                                      ///Visa type
                                      Text(
                                        'Visa type',
                                        style: TextStyleHelper.white16W600Inter,
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
                                                dropdownColor: ColorHelper.kBG,
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
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
                                                            ? 'Select Type'
                                                            : dropDownValue!,
                                                        style: TextStyleHelper
                                                            .kWhite14W400Inter),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                items: [
                                                  'Employment Visa',
                                                  'Business Visa',
                                                  'Project Visa',
                                                  '“X”/ Entry visa',
                                                  'Tourist Visa',
                                                  'Research Visa',
                                                  'Transit Visa',
                                                  'Conference Visa',
                                                  'Medical Visa',
                                                  'Student Visa',
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

                                      ///Place of Issue
                                      Text(
                                        'Place of Issue',
                                        style: TextStyleHelper.white16W600Inter,
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
                                                dropdownColor: ColorHelper.kBG,
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                underline: const SizedBox(),
                                                icon: SvgPicture.asset(
                                                  'assets/icons/arrow-circle-down.svg',
                                                  height: 22,
                                                  color: Colors.white,
                                                ),
                                                hint: Row(
                                                  children: [
                                                    Text(
                                                        dropDownValue1 == null
                                                            ? 'Select Place'
                                                            : dropDownValue1!,
                                                        style: TextStyleHelper
                                                            .kWhite14W400Inter),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                items: [
                                                  'London',
                                                  'Iceland',
                                                  'New York',
                                                  'Santorini',
                                                  'Prague',
                                                  'Dubai',
                                                  'Tokyo',
                                                  'Jakarta',
                                                  'Beijing',
                                                  'Dhaka',
                                                  'Canada',
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
                                                      dropDownValue1 = value1;
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

                                      ///Visa Country
                                      Text(
                                        'Visa Country',
                                        style: TextStyleHelper.white16W600Inter,
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
                                                dropdownColor: ColorHelper.kBG,
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
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
                                                            ? 'Select Country'
                                                            : dropDownValue!,
                                                        style: TextStyleHelper
                                                            .kWhite14W400Inter),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                items: [
                                                  'Afghanistan',
                                                  'Australia',
                                                  'Bahamas',
                                                  'Bhutan',
                                                  'Canada',
                                                  'China',
                                                  'Finland',
                                                  'Germany',
                                                  'India',
                                                  'Korea',
                                                  'Philippines',
                                                  'Africa',
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

                                      ///Visa Designation
                                      Text(
                                        'Visa Designation',
                                        style: TextStyleHelper.white16W600Inter,
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
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style:
                                              TextStyleHelper.kWhite14W400Inter,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 16,
                                      ),

                                      ///Entry Permit No.
                                      Text(
                                        'Entry Permit No.',
                                        style: TextStyleHelper.white16W600Inter,
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
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style:
                                              TextStyleHelper.kWhite14W400Inter,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 16,
                                      ),

                                      ///Visa Issue Date
                                      Text(
                                        'Visa Issue Date',
                                        style: TextStyleHelper.white16W600Inter,
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
                                            Text(
                                                DateFormat.yMd().format(
                                                    controller.visaDate),
                                                style: TextStyleHelper
                                                    .kWhite14W400Inter),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () async {
                                                controller.issueDate(context);
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

                                      ///Visa Expiry Date
                                      Text(
                                        'Visa Expiry Date',
                                        style: TextStyleHelper.white16W600Inter,
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
                                            Text(
                                                DateFormat.yMd().format(
                                                    controller.visaExpiryDate),
                                                style: TextStyleHelper
                                                    .kWhite14W400Inter),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () async {
                                                controller.expiryDate(context);
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

                                      ///Attach your Document
                                      Text(
                                        'Attach your Document',
                                        style: TextStyleHelper.white16W600Inter,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      GestureDetector(
                                        onTap: () async {
                                          controller.pickFile();
                                        },
                                        child: controller.fileName.isEmpty
                                            ? Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: size.height * 0.052,
                                                  width: size.width * 0.547,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: ColorHelper
                                                            .kPrimary),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            56.r),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/icons/export.svg'),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        'Upload (Size Limit: 5MB)',
                                                        style: TextStyleHelper
                                                            .kPrimary12W500Inter,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.r),
                                                  color: Colors.white
                                                      .withOpacity(0.1),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/icons/file.svg'),
                                                            Positioned(
                                                              top: 20,
                                                              bottom: 20,
                                                              left: -3,
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height: 21,
                                                                width: 54,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                                child: const Text(
                                                                    'JPEG',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            9,
                                                                        fontWeight:
                                                                            FontWeight.w900)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () async {
                                                            controller
                                                                .pickFile();
                                                          },
                                                          child: SvgPicture.asset(
                                                              'assets/icons/change.svg'),
                                                        ),
                                                        const SizedBox(
                                                          width: 15,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            openFile(controller
                                                                .file1!);
                                                          },
                                                          child: SvgPicture.asset(
                                                              'assets/icons/eye.svg'),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      controller.fileName,
                                                      style: TextStyleHelper
                                                          .kWhite14W400Inter,
                                                    )
                                                  ],
                                                ),
                                              ),
                                      ),

                                      const SizedBox(
                                        height: 16,
                                      ),

                                      CommonButton().saveButton(context),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 36),
                            ],
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

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
