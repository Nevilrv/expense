import 'dart:developer';
import 'dart:ui';
import 'package:blur/blur.dart';
import 'package:expense/Common/common_widget.dart';
import 'package:expense/Controller/drawer_controller.dart';
import 'package:expense/Controller/home_screen_controller.dart';
import 'package:expense/View/Expense/expense_screen.dart';
import 'package:expense/View/letters_screen/letter_requests_screen.dart';
import 'package:expense/View/notification/notification_screen.dart';
import 'package:expense/View/payslip/payslip_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'Custom/slide_to_act.dart';
import 'View/leaves/leave_screen.dart';
import 'constant/color_helper.dart';
import 'constant/text_style_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<SlideActionState> _containerKey = GlobalKey();
  final GlobalKey<SlideActionState> _container2Key = GlobalKey();
  final GlobalKey<SlideActionState> _container3Key = GlobalKey();
  final GlobalKey<SlideActionState> _container4Key = GlobalKey();
  DrawerGetController drawerGetController = Get.find();
  bool expansionChanges1 = true;
  List<Map<String, dynamic>> listView = [
    {
      "icon": Iconsax.wallet_money,
      "name": "LEAVE",
      "screen": const LeaveScreen()
    },
    {
      "icon": Iconsax.clipboard_export,
      "name": "EXPENSE",
      "screen": const ExpenseScreen()
    },
    {
      "icon": Iconsax.document_download,
      "name": "LETTERS",
      "screen": const LetterRequestsScreen()
    },
    {
      "icon": Iconsax.wallet_money,
      "name": "PAYSLIPS",
      "screen": const PaySlipScreen()
    }
  ];

  List<Map<String, dynamic>> leveRequestList = [
    {
      "day": '4 Feb 2023',
      "name": "The Pods - Blue Waters",
      "icon": "10:21pm",
      "color": Colors.green,
    },
    {
      "day": "12 Feb 2023",
      "name": "The Pods - Blue Waters",
      "icon": "10:21am",
      "color": Colors.green,
    },
    {
      "day": "14 Feb 2023",
      "name": "The Pods - Blue Waters",
      "icon": "10:21pm",
      "color": Colors.red,
    },
  ];

  HomeScreenController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.kBG,
        onDrawerChanged: (val) {
          log("val----$val");
          drawerGetController.setDrawer(val);
          log("isDrawer---${drawerGetController.isDrawer}");
        },
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: ColorHelper.kBG.withOpacity(0.9),
          child: Global()
              .commonDrawer(context: context, size: size, key: _scaffoldKey),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: -size.height * 0.13,
                left: -size.width * 0.07,
                child: Stack(children: [
                  Image.asset(
                    'assets/icons/People.png',
                    height: size.height * 0.36,
                  ),
                  Positioned(
                    bottom: size.height * 0.18,
                    left: size.width * 0.12,
                    child: InkWell(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Icon(
                        Iconsax.menu_1,
                        color: ColorHelper.fontColor,
                        size: 25.h,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.115,
                    left: size.width * 0.12,
                    child: Text("hi, Inez",
                        style: TextStyleHelper.kfontColor22W700Inter),
                  ),
                  Positioned(
                      bottom: size.height * 0.06,
                      left: size.width * 0.12,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const NotificationScreen());
                        },
                        child: Container(
                          height: size.height * 0.045,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(51, 22, 0, 0.14),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.notification,
                                  color: ColorHelper.fontColor,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  "3",
                                  style: TextStyleHelper.kfontColor16W600Inter,
                                )
                              ]),
                        ),
                      )),
                ]),
              ),
              Positioned(
                top: size.height * 0.33,
                left: size.width * 0.77,
                child: Image.asset(
                  'assets/icons/Sales.png',
                  height: 250,
                ),
              ),
              Positioned(
                top: size.height * 0.6,
                right: size.width * 0.8,
                child: Image.asset(
                  'assets/icons/Finance.png',
                  height: size.height * 0.3,
                ),
              ),
              Positioned(
                top: size.height * 0.06,
                left: size.width * 0.55,
                child: Container(
                    width: size.height * 0.15,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(255, 192, 145, 0.2),
                              blurRadius: 50,
                              spreadRadius: 0.9,
                              offset: Offset(0.1, 0.8))
                        ],
                        image: const DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100.r))),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.26,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      /// NO INTERNET CONNECTION >>>>>>>>>>

                      /*   Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        child: Container(
                          height: size.height * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color(0xffA8200D)),
                          ),
                          child: Blur(
                            blur: 10,
                            colorOpacity: 0.25,
                            overlay: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Icon(Iconsax.info_circle,
                                        color: Color(0xffA8200D), size: 60.h),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.020,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Device not connected to the Internet",
                                      style:
                                          TextStyleHelper.kPrimary16W600Inter,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.020,
                                  ),
                                  const Divider(
                                    height: 0,
                                    thickness: 2,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.020,
                                  ),
                                  Center(
                                    child: Text(
                                      "It seems like you are having internet\nconnectivity issues. Please check your\ninternet connection and try again.",
                                      style: TextStyleHelper.kWhite16W400Inter,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(30),
                            blurColor: ColorHelper.kBGBlur,
                            child: Container(),
                          ),
                        ),
                      ),*/

                      GetBuilder<HomeScreenController>(
                        builder: (controller) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned.fill(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 4, sigmaY: 5),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        decoration: BoxDecoration(
                                            color: ColorHelper.kBGBlur
                                                .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(24.r)),
                                      ),
                                    ),
                                  ),
                                  controller.Container1 == true
                                      ? qrClockIn(size)
                                      : controller.Container2 == true
                                          ? qrClockOut(size)
                                          : controller.Container3 == true
                                              ? qrClockInTime(size)
                                              : controller.Container4 == true
                                                  ? clockOutNoLocation(size)
                                                  : controller.Container5 ==
                                                          true
                                                      ? workBreak(size)
                                                      : const SizedBox()
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: SizedBox(
                          height: size.height * 0.12,
                          width: size.width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: ListView.builder(
                              itemCount: listView.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                log("listView.length--------------> ${listView.length}");
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                listView[index]["screen"],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: size.height * 0.1,
                                        width: size.height * 0.1,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              47, 45, 41, 0.4),
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              listView[index]['icon'],
                                              size: 30.h,
                                              color: ColorHelper.kPrimary,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.005,
                                            ),
                                            Text(
                                              listView[index]['name'],
                                              style: TextStyleHelper
                                                  .kWhite10W700Inter,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.020,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.r),
                          child: Stack(clipBehavior: Clip.none, children: [
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          ColorHelper.kBGBlur.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(24.r)),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                //  border: Border.all(color: ColorHelper.fontColor),
                              ),
                              child: Theme(
                                data:
                                    ThemeData(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  initiallyExpanded: true,
                                  trailing: expansionChanges1
                                      ? SvgPicture.asset(
                                          'assets/icons/arrow-circle-up.svg',
                                          height: 28,
                                          color: ColorHelper.kPrimary,
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/arrow-circle-down.svg',
                                          height: 28,
                                          color: ColorHelper.kPrimary,
                                        ),
                                  title: Text(
                                    'Activity',
                                    style: TextStyleHelper.kPrimary22W600Inter
                                        .copyWith(color: Colors.white),
                                  ),
                                  onExpansionChanged: (bool value) {
                                    setState(() {
                                      expansionChanges1 = value;
                                    });
                                  },
                                  children: [
                                    Divider(
                                      thickness: size.height * 0.002,
                                      color: Colors.black,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: leveRequestList.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: size.width * 0.05,
                                                  vertical:
                                                      size.height * 0.015),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                          radius: 23.r,
                                                          backgroundColor:
                                                              index.isOdd
                                                                  ? ColorHelper
                                                                      .fontColor
                                                                  : ColorHelper
                                                                      .kPrimary,
                                                          child: Icon(
                                                            index.isOdd
                                                                ? Iconsax
                                                                    .timer_start
                                                                : Iconsax
                                                                    .timer_pause,
                                                            color: index.isOdd
                                                                ? ColorHelper
                                                                    .kPrimary
                                                                : ColorHelper
                                                                    .fontColor,
                                                          )),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.015,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: size.width *
                                                                0.55,
                                                            child: Text(
                                                              leveRequestList[
                                                                      index]
                                                                  ['name'],
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: TextStyleHelper
                                                                  .kWhite16W600Inter,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                size.height *
                                                                    0.010,
                                                          ),
                                                          Text(
                                                              leveRequestList[
                                                                  index]['day'],
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: TextStyleHelper
                                                                  .kgrey12W500Inter),
                                                        ],
                                                      ),
                                                      Text(
                                                          leveRequestList[index]
                                                              ['icon'],
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyleHelper
                                                              .white14W600Inter),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: size.height * 0.020,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.1027,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Container1
  qrClockIn(Size size) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30.r),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.020,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Scan QR Code to Clock-in",
                    style: TextStyleHelper.kPrimary16W600Inter,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                const Divider(
                  height: 0,
                  thickness: 2,
                  color: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                Text(
                  "Please scan the QR code provided by your organization to clock-in to Max",
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.kWhite16W400Inter,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SlideAction(
                  key: _containerKey,
                  onSubmit: () {
                    Future.delayed(const Duration(seconds: 1), () {
                      _containerKey.currentState?.reset();
                      controller.Container1 = false;
                      controller.Container2 = true;
                      controller.clockIn = '${DateTime.now()}';
                      controller.updateMethod();
                      setState(() {});
                    });
                  },
                  height: size.height * 0.067,
                  borderRadius: 30,
                  sliderButtonIcon: Container(
                    height: size.height * 0.056,
                    width: size.width * 0.11,
                    decoration: const BoxDecoration(
                        color: Color(0xFF211F1D), shape: BoxShape.circle),
                    child: Center(
                        child: Icon(
                      Iconsax.timer_pause,
                      color: ColorHelper.kPrimary,
                      size: 24,
                    )),
                  ),
                  outerColor: ColorHelper.kPrimary,
                  text: 'Slide to Clock-In',
                  textStyle: TextStyleHelper.kPrimary18W600Inter,
                  sliderButtonIconPadding: 0,
                  innerColor: Colors.transparent,
                  sliderButtonYOffset: -5,
                  submittedIcon: Icon(
                    Icons.check_circle_outline,
                    size: 35,
                    color: ColorHelper.fontColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Container2
  qrClockOut(Size size) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return commonContainer(size,
            key: _container2Key,
            title: "Clocked-in at",
            date: controller.dateFormat
                .format(DateTime.parse(controller.clockIn)),
            time: controller.timeFormat
                .format(DateTime.parse(controller.clockIn)),
            location: "The Pods - Blue Waters",
            locationIcon: Iconsax.location,
            locationTextStyle: TextStyleHelper.kWhite14W600Inter,
            sliderText: "Slide to Clock-Out", onSubmit: () {
          Future.delayed(
            const Duration(seconds: 1),
            () {
              _container2Key.currentState?.reset();
              controller.Container2 = false;
              controller.Container3 = true;
              controller.clockOut = '${DateTime.now()}';
              controller.updateMethod();
              setState(() {});
            },
          );
        });
      },
    );
  }

  ///Container3
  qrClockInTime(Size size) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return commonContainer(size,
            key: _container3Key,
            title: "Clocked-out at",
            date: controller.dateFormat
                .format(DateTime.parse(controller.clockOut)),
            time: controller.timeFormat
                .format(DateTime.parse(controller.clockOut)),
            location: "The Pods - Blue Waters",
            locationIcon: Iconsax.location,
            locationTextStyle: TextStyleHelper.kWhite14W600Inter,
            sliderText: "Slide to Clock-In", onSubmit: () {
          Future.delayed(const Duration(seconds: 1), () {
            _container3Key.currentState?.reset();
            controller.Container3 = false;
            controller.Container4 = true;
            controller.clockIn1 = '${DateTime.now()}';
            controller.updateMethod();
            setState(() {});
          });
        });
      },
    );
  }

  /// Container4
  clockOutNoLocation(Size size) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return commonContainer(size,
            key: _container4Key,
            title: "Clocked-in at",
            date: controller.dateFormat
                .format(DateTime.parse(controller.clockIn1)),
            time: controller.timeFormat
                .format(DateTime.parse(controller.clockIn1)),
            location: "Location Not Available",
            locationIcon: Iconsax.location_cross,
            locationTextStyle: TextStyleHelper.kWhite14W600Inter
                .copyWith(color: const Color(0xFF868685)),
            sliderText: "Slide to Clock-Out", onSubmit: () {
          Future.delayed(const Duration(seconds: 1), () {
            _container4Key.currentState?.reset();
            controller.Container4 = false;
            controller.Container5 = true;
            controller.clockOut1 = '${DateTime.now()}';
            controller.updateMethod();
            setState(() {});
          });
        });
      },
    );
  }

  ///Container5
  workBreak(Size size) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.011,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Out of Radius from",
                      style: TextStyleHelper.kPrimary12W500Inter,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        controller.timeFormat
                            .format(DateTime.parse(controller.clockOut1)),
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter-Medium',
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.010,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        controller.dateFormat
                            .format(DateTime.parse(controller.clockOut1)),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.020,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                      height: 0,
                      thickness: 1,
                      color: ColorHelper.kPrimary,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Iconsax.location_cross,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.028,
                      ),
                      Text(
                        "Location Not Available",
                        style: TextStyleHelper.kWhite14W600Inter
                            .copyWith(color: const Color(0xFF868685)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Container(
                    height: size.height * 0.067,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: ColorHelper.kPrimary,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'Start Work Break',
                        style: TextStyleHelper.kPrimary18W600Inter
                            .copyWith(color: ColorHelper.fontColor),
                      ),
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

  ///commonContainer
  commonContainer(Size size,
      {String? title,
      String? time,
      String? date,
      String? location,
      String? sliderText,
      Key? key,
      Function()? onSubmit,
      IconData? locationIcon,
      TextStyle? locationTextStyle}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.011,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${title}",
                  style: TextStyleHelper.kPrimary12W500Inter,
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Align(
                alignment: Alignment.center,
                child: Text('$time',
                    style: TextStyle(
                      fontSize: 31.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter-Medium',
                    )),
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Align(
                alignment: Alignment.center,
                child: Text("$date",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    )),
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  height: 0,
                  thickness: 1,
                  color: ColorHelper.kPrimary,
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    locationIcon,
                    color: ColorHelper.kPrimary,
                    size: 20,
                  ),
                  SizedBox(
                    width: size.width * 0.028,
                  ),
                  Text(
                    "$location",
                    style: locationTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              SlideAction(
                key: key,
                onSubmit: onSubmit,
                height: size.height * 0.067,
                borderRadius: 30.r,
                sliderButtonIcon: Container(
                  height: size.height * 0.056,
                  width: size.width * 0.11,
                  decoration: const BoxDecoration(
                      color: Color(0xFF211F1D), shape: BoxShape.circle),
                  child: Center(
                      child: Icon(
                    Iconsax.timer_pause,
                    color: ColorHelper.kPrimary,
                    size: 24.h,
                  )),
                ),
                outerColor: ColorHelper.kPrimary,
                text: '$sliderText',
                textStyle: TextStyleHelper.kPrimary18W600Inter
                    .copyWith(color: ColorHelper.fontColor),
                sliderButtonIconPadding: 0,
                innerColor: Colors.transparent,
                sliderButtonYOffset: -5,
                submittedIcon: Icon(
                  Icons.check_circle_outline,
                  size: 35.h,
                  color: ColorHelper.fontColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
