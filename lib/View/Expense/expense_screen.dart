import 'package:blur/blur.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expense/View/Assets/add_assets_screen.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:expense/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'add_expense_screen.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List tabs = ['Expense', 'Assets', 'Documents', 'Work', 'Personal'];
  int select = 0;

  ExpenseScreenController expenseScreenController =
      Get.put(ExpenseScreenController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GetBuilder<ExpenseScreenController>(
        builder: (controller) {
          return Scaffold(
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
                    right: size.width * 0.8,
                    child: Image.asset(
                      'assets/icons/Finance.png',
                      height: size.height * 0.3,
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.height * 0.38,
                            width: size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: controller.imageFile != null
                                    ? FileImage(controller.imageFile!)
                                        as ImageProvider
                                    : const AssetImage(
                                        'assets/images/profile.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: size.height * 0.38,
                              padding: EdgeInsets.all(size.width * 0.05),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                gradient: LinearGradient(
                                  begin: FractionalOffset.center,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black,
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/arrow-left-rounded.svg',
                                    height: 35,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Inez Nunez',
                                            style: TextStyleHelper
                                                .kPrimary30W600Inter,
                                          ),
                                          Text(
                                            'Restaurant Operations',
                                            style: TextStyleHelper
                                                .kWhite16W400Inter,
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                              backgroundColor: ColorHelper.kBG,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                height: size.height * 0.15,
                                                width: size.width * 0.7,
                                                padding: EdgeInsets.all(
                                                    size.height * 0.02),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Select photo',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: ColorHelper
                                                              .kPrimary),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          size.height * 0.02,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                                    ColorHelper
                                                                        .kPrimary),
                                                          ),
                                                          onPressed: () async {
                                                            await controller
                                                                .getImageFromCamera();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Camera',
                                                            style: TextStyle(
                                                                color:
                                                                    ColorHelper
                                                                        .kBG),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                                    ColorHelper
                                                                        .kPrimary),
                                                          ),
                                                          onPressed: () async {
                                                            await controller
                                                                .getImageFromGallery();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Gallery',
                                                            style: TextStyle(
                                                                color:
                                                                    ColorHelper
                                                                        .kBG),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: ColorHelper.kPrimary,
                                          child: SvgPicture.asset(
                                              'assets/icons/camera.svg'),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: size.height * 0.44,
                        margin: EdgeInsets.all(size.width * 0.025),
                        child: Blur(
                          blur: 10,
                          colorOpacity: 0.3,
                          overlay: Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/arrow-left.svg',
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        child: Row(
                                          children: List.generate(
                                            tabs.length,
                                            (index) => GestureDetector(
                                              onTap: () {
                                                controller.changeValue(index);
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 7),
                                                height: 34,
                                                width: size.width * 0.25,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color:
                                                          ColorHelper.kPrimary),
                                                  color:
                                                      controller.select == index
                                                          ? ColorHelper.kPrimary
                                                          : Colors.transparent,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    tabs[index],
                                                    style: controller.select ==
                                                            index
                                                        ? TextStyleHelper
                                                            .kBG14WBOLDInter
                                                        : TextStyleHelper
                                                            .kWhite14WBOLDInter,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                controller.select == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddExpense(),
                                              ));
                                        },
                                        child: DottedBorder(
                                          color: ColorHelper.kPrimary,
                                          strokeWidth: 1,
                                          dashPattern: const [10, 5],
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(16),
                                          child: Container(
                                            width: size.width,
                                            height: size.height * 0.12,
                                            decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(0.14),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/add-circle.svg'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    'Add Expense',
                                                    style: TextStyleHelper
                                                        .kLightGrey16W600Inter,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddAssets(),
                                            ),
                                          );
                                        },
                                        child: DottedBorder(
                                          color: ColorHelper.kPrimary,
                                          strokeWidth: 1,
                                          dashPattern: const [10, 5],
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(16),
                                          child: Container(
                                            width: size.width,
                                            height: size.height * 0.12,
                                            decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(0.14),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/add-circle.svg'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    'Request Asset',
                                                    style: TextStyleHelper
                                                        .kLightGrey16W600Inter,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 15,
                                ),
                                controller.select == 0
                                    ? Slidable(
                                        startActionPane: ActionPane(
                                          key: const ValueKey(0),
                                          motion: const ScrollMotion(),
                                          children: [
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            SvgPicture.asset(
                                                'assets/icons/tick-circle.svg'),
                                            SlidableAction(
                                              onPressed: (context) {},
                                              backgroundColor:
                                                  Colors.transparent,
                                              foregroundColor: Colors.white,
                                              label: 'Reimbursement',
                                            ),
                                          ],
                                        ),
                                        endActionPane: ActionPane(
                                          key: const ValueKey(0),
                                          motion: const ScrollMotion(),
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            SvgPicture.asset(
                                                'assets/icons/edit.svg'),
                                            SlidableAction(
                                              padding: EdgeInsets.only(
                                                  right: size.width * 0.073),
                                              onPressed: (context) {},
                                              backgroundColor:
                                                  Colors.transparent,
                                              foregroundColor: Colors.white,
                                              label: 'Edit Expense',
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          width: size.width,
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.14),
                                            border: Border.all(
                                                color: ColorHelper.kDarkGrey),
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/icons/wallet.svg'),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      'Medical',
                                                      style: TextStyleHelper
                                                          .kLightGrey16W600Inter,
                                                    ),
                                                    const Spacer(),
                                                    SvgPicture.asset(
                                                        'assets/icons/Kebab Menu Horizontal.svg',
                                                        height: 20),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  '40 AED',
                                                  style: TextStyleHelper
                                                      .kLightGrey16W600Inter,
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Receipt Number:',
                                                      style: TextStyleHelper
                                                          .kWhite10W500Inter,
                                                    ),
                                                    Text(
                                                      'N-051-a2475',
                                                      style: TextStyleHelper
                                                          .kWhite10W700Inter,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Expense Date:',
                                                      style: TextStyleHelper
                                                          .kWhite10W500Inter,
                                                    ),
                                                    Text(
                                                      '02/04/27',
                                                      style: TextStyleHelper
                                                          .kWhite10W700Inter,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Slidable(
                                        startActionPane: ActionPane(
                                          key: const ValueKey(0),
                                          motion: const ScrollMotion(),
                                          children: [
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            SvgPicture.asset(
                                                'assets/icons/tick-circle.svg'),
                                            SlidableAction(
                                              onPressed: (context) {},
                                              backgroundColor:
                                                  Colors.transparent,
                                              foregroundColor: Colors.white,
                                              label: 'Reimbursement',
                                            ),
                                          ],
                                        ),
                                        endActionPane: ActionPane(
                                          key: const ValueKey(0),
                                          motion: const ScrollMotion(),
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            SvgPicture.asset(
                                                'assets/icons/edit.svg'),
                                            SlidableAction(
                                              padding: EdgeInsets.only(
                                                  right: size.width * 0.073),
                                              onPressed: (context) {},
                                              backgroundColor:
                                                  Colors.transparent,
                                              foregroundColor: Colors.white,
                                              label: 'Edit Expense',
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          width: size.width,
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.14),
                                            border: Border.all(
                                                color: ColorHelper.kDarkGrey),
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'HP Dell - Mac 10',
                                                  style: TextStyleHelper
                                                      .kWhite144WBOLDInter,
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/icons/monitor-mobbile.svg'),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      'Laptop',
                                                      style: TextStyleHelper
                                                          .kLightGrey16W600Inter,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Receipt Number:',
                                                      style: TextStyleHelper
                                                          .kWhite10W500Inter,
                                                    ),
                                                    Text(
                                                      'N-051-a2475',
                                                      style: TextStyleHelper
                                                          .kWhite10W700Inter,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Issue Date: ',
                                                      style: TextStyleHelper
                                                          .kWhite10W500Inter,
                                                    ),
                                                    Text(
                                                      '02/04/27',
                                                      style: TextStyleHelper
                                                          .kWhite10W700Inter,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View more',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: ColorHelper.kPrimary),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/arrow-circle-right.svg',
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(30),
                          blurColor: ColorHelper.kBGBlur,
                          child: Container(),
                        ),
                      ),
                      controller.select == 0
                          ? Container(
                              height: size.height * 0.57,
                              margin: EdgeInsets.all(size.width * 0.025),
                              child: Blur(
                                blur: 10,
                                colorOpacity: 0.3,
                                overlay: Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Expense History',
                                        style: TextStyleHelper
                                            .kLightGrey16W600Inter,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      expenseHistory(size),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      expenseHistory(size),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'View more',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: ColorHelper.kPrimary),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/arrow-circle-right.svg',
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(30),
                                blurColor: ColorHelper.kBGBlur,
                                child: Container(),
                              ),
                            )
                          : Container(
                              height: size.height * 0.43,
                              margin: EdgeInsets.all(size.width * 0.025),
                              child: Blur(
                                blur: 10,
                                colorOpacity: 0.3,
                                overlay: Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Asset History',
                                        style: TextStyleHelper
                                            .kLightGrey16W600Inter,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      assetHistory(size),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      assetHistory(size),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'View more',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: ColorHelper.kPrimary),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/arrow-circle-right.svg',
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(30),
                                blurColor: ColorHelper.kBGBlur,
                                child: Container(),
                              ),
                            )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container expenseHistory(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        border: Border.all(color: ColorHelper.kDarkGrey),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/wallet.svg'),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Medical',
                  style: TextStyleHelper.kLightGrey16W600Inter,
                ),
                const Spacer(),
                SvgPicture.asset('assets/icons/Kebab Menu Horizontal.svg',
                    height: 20),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Receipt Number:',
                  style: TextStyleHelper.kWhite10W500Inter,
                ),
                Text(
                  'N-051-a2475',
                  style: TextStyleHelper.kWhite10W700Inter,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reimbursement Date:',
                  style: TextStyleHelper.kWhite10W500Inter,
                ),
                Text(
                  '02/04/27',
                  style: TextStyleHelper.kWhite10W700Inter,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expense Date:',
                  style: TextStyleHelper.kWhite10W500Inter,
                ),
                Text(
                  '02/04/27',
                  style: TextStyleHelper.kWhite10W700Inter,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 35,
              decoration: BoxDecoration(
                  color: ColorHelper.kBGBlur,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: ColorHelper.kPrimary.withOpacity(0.3),
                      blurRadius: 2,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('View Remarks',
                        style: TextStyleHelper.kWhite10W700Inter),
                    SvgPicture.asset('assets/icons/arrow-circle-down.svg')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container assetHistory(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        border: Border.all(color: ColorHelper.kDarkGrey),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HP Dell - Mac 10',
              style: TextStyleHelper.kWhite144WBOLDInter,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/monitor-mobbile.svg'),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Laptop',
                  style: TextStyleHelper.kLightGrey16W600Inter,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Receipt Number:',
                  style: TextStyleHelper.kWhite10W500Inter,
                ),
                Text(
                  'N-051-a2475',
                  style: TextStyleHelper.kWhite10W700Inter,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Issue Date:',
                  style: TextStyleHelper.kWhite10W500Inter,
                ),
                Text(
                  '02/04/27',
                  style: TextStyleHelper.kWhite10W700Inter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
