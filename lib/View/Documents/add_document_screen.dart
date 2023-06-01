import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:expense/View/Documents/Mandatory/add_passport_screen.dart';
import 'package:expense/View/Documents/Non-Mandatory/add_custom_document_screen.dart';
import 'package:expense/View/Expense/expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/expense_controller.dart';
import '../../constant/color_helper.dart';
import '../../constant/text_style_helper.dart';
import 'Mandatory/add_Insurance_screen.dart';
import 'Mandatory/add_educational_certificate_screen.dart';
import 'Mandatory/add_emirates_card_screen.dart';
import 'Mandatory/add_emirates_id_screen.dart';
import 'Mandatory/add_labour_card.dart';
import 'Mandatory/add_passport_photo_screen.dart';
import 'Mandatory/add_visa_screen.dart';
import 'Non-Mandatory/add_diploma_certificates.dart';

class AddDocumentScreen extends StatefulWidget {
  const AddDocumentScreen({Key? key}) : super(key: key);

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  int index = 0;

  List<Map<String, dynamic>> mandatory = [
    {
      'title': 'Passport Photo (Max: 1MB)',
      'screen': const AddPassportPhotoScreen(),
    },
    {
      'title': 'Passport',
      'screen': const AddPassportScreen(),
    },
    {
      'title': 'Visa',
      'screen': const AddVisaScreen(),
    },
    {
      'title': 'Labour Card',
      'screen': const AddLabourCardScreen(),
    },
    {
      'title': 'Emirates ID Application Form',
      'screen': const AddEmiratesIdScreen(),
    },
    {
      'title': 'Emirates ID  Card',
      'screen': const AddEmiratesCardScreen(),
    },
    {
      'title': 'Insurance Card',
      'screen': const AddInsuranceScreen(),
    },
    {
      'title': 'Educational Certificate',
      'screen': const AddEducationCertificatesScreen(),
    },
  ];

  ExpenseScreenController expenseScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.kBG,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: -size.height * 0.12,
                left: -size.width * 0.26,
                child: Image.asset(
                  'assets/icons/People.png',
                  height: 250,
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 45.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: Stack(clipBehavior: Clip.none, children: [
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 5),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                              color: ColorHelper.kBGBlur.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(24.r)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: size.width * 0.025,
                        right: size.width * 0.025,
                      ),
                      child: Column(
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
                                Text(
                                  'Add document',
                                  style: TextStyleHelper.kPrimary20W600Inter,
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
                            height: size.height * 0.028,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                                'Select which document you would like to add',
                                textAlign: TextAlign.justify,
                                style: TextStyleHelper.kWhite15W600Inter),
                          ),
                          SizedBox(
                            height: size.height * 0.017,
                          ),
                          Container(
                            height: size.height * 0.040,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.height * 0.017),
                            decoration: BoxDecoration(
                              color: const Color(0xff2F2D29).withOpacity(0.4),
                              border: Border.all(color: ColorHelper.kDarkGrey),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              physics: const NeverScrollableScrollPhysics(),
                              onTap: (value) {
                                setState(() {
                                  index = value;
                                });
                              },
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: const Color(0xffFFC091),
                                  border: Border.all(color: Colors.white)),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Center(
                                  child: Text(
                                    'Mandatory',
                                    style: TextStyleHelper.kPrimary20W600Inter
                                        .copyWith(
                                      fontSize: 14.sp,
                                      color: index == 0
                                          ? ColorHelper.fontColor
                                          : const Color(
                                              0xffF7F6F5,
                                            ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'Non-Mandatory',
                                    style: TextStyleHelper.kPrimary20W600Inter
                                        .copyWith(
                                      fontSize: 14.sp,
                                      color: index == 1
                                          ? ColorHelper.fontColor
                                          : const Color(
                                              0xffF7F6F5,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: size.height * 0.68,
                            child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _tabController,
                                children: [
                                  Column(
                                    children: List.generate(
                                      mandatory.length,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  mandatory[index]['screen'],
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 15, right: 15, bottom: 15),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: size.height * 0.064,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.14),
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                mandatory[index]['title'],
                                                style: TextStyleHelper
                                                    .white14W400Inter,
                                              ),
                                              const Spacer(),
                                              SvgPicture.asset(
                                                  'assets/icons/arrow-circle-right.svg'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddDiplomaCertificates(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 15, right: 15, bottom: 15),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: size.height * 0.064,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.14),
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Diploma Certificate',
                                                style: TextStyleHelper
                                                    .white14W400Inter,
                                              ),
                                              const Spacer(),
                                              SvgPicture.asset(
                                                  'assets/icons/arrow-circle-right.svg'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddCustomDocumentScreen(),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: DottedBorder(
                                            color: ColorHelper.kPrimary,
                                            strokeWidth: 1,
                                            dashPattern: const [10, 5],
                                            borderType: BorderType.RRect,
                                            radius: const Radius.circular(16),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              height: size.height * 0.064,
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.14),
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Add Custom Document',
                                                    style: TextStyleHelper
                                                        .white14W400Inter,
                                                  ),
                                                  const Spacer(),
                                                  SvgPicture.asset(
                                                      'assets/icons/arrow-circle-right.svg'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
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
