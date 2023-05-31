import 'dart:developer';
import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constant/color_helper.dart';
import '../../constant/text_style_helper.dart';
import '../Expense/expense_screen.dart';

class RequestLetterScreens extends StatefulWidget {
  const RequestLetterScreens({Key? key}) : super(key: key);

  @override
  State<RequestLetterScreens> createState() => _RequestLetterScreensState();
}

class _RequestLetterScreensState extends State<RequestLetterScreens> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _controller = PageController();

  List<String> requests = [
    'NOC Release Letter',
    'Passport Letter',
    'Salary Transfer Letter',
    'Experience Letter',
    'Other'
  ];

  int selectPage = 0;
  List scroll = [0];
  DateTime? selectDate1;
  DateTime today = DateTime.now();
  bool open = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      // Keyboard is visible.
      print('Keyboard is visible');

      setState(() {
        open = true;
      });
    } else {
      // Keyboard is not visible.
      setState(() {
        open = false;
      });
      print('Keyboard is not visible');
    }
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorHelper.fontColor,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              child: Container(
                height: size.height * 0.18,
                width: size.width * 0.32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/icons/circle.png",
                      ),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.4,
              left: size.width * 0.8,
              child: RotatedBox(
                quarterTurns: 3,
                child: Image.asset(
                  'assets/icons/Sales.png',
                  height: 300,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.60,
              right: size.width * 0.85,
              child: Image.asset(
                'assets/icons/Finance.png',
                height: size.height * 0.3,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.070),
              child: Container(
                height: size.height * 1.10,
                margin: EdgeInsets.all(size.width * 0.025),
                child: Blur(
                  blur: 10,
                  colorOpacity: 0.25,
                  overlay: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/arrow-left-rounded.svg',
                                height: 35,
                              ),
                            ),
                            Text(
                              'Request Letter',
                              style: TextStyleHelper.kPrimary22W600Inter,
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
                        height: size.height * 0.04,
                      ),
                      Expanded(
                        child: PageView(
                          controller: _controller,
                          onPageChanged: (index) {
                            log('index---------->>>>>> $index');
                            selectPage = index;
                            if (scroll.contains(selectPage)) {
                              log('CONTAIN');
                            } else {
                              scroll.add(selectPage);
                            }
                            if (scroll.last > selectPage) {
                              scroll.remove(scroll.last);

                              log('REMOVE DATA $scroll');
                            }
                            setState(() {});
                          },
                          children: [
                            firstPage(size),
                            secondPage(size),
                            thirdPage(size),
                          ],
                        ),
                      ),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                  blurColor: ColorHelper.kBGBlur,
                  child: Container(),
                ),
              ),
            ),
            Visibility(
              visible: !open,
              child: Positioned(
                  bottom: size.height * 0.030,
                  left: size.width / 2.5,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Row(
                        children: [
                          scroll.contains(index)
                              ? Image.asset(
                                  "assets/icons/circle_pageview.png",
                                  height: 21,
                                  width: 21,
                                )
                              : Container(
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white)),
                                ),
                          SizedBox(
                            width: size.width * 0.015,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  firstPage(Size size) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
          ),
          child: Text(
            'What type of Letter do you want to request?',
            style: TextStyleHelper.kWhite18W600Inter,
          ),
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: requests.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.036,
                  vertical: size.height * 0.011),
              child: Container(
                height: size.height * 0.078,
                width: size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(16.r)),
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.044,
                    ),
                    Text(
                      requests[index],
                      style: TextStyleHelper.kPrimary16W600Inter,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  secondPage(Size size) {
    return Column(
      children: [
        Text(
          'Select a date of issue for the letter',
          style: TextStyleHelper.kWhite18W600Inter,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: size.height * 0.4,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.14),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: TableCalendar(
            focusedDay: today,
            firstDay: DateTime(2000),
            lastDay: DateTime.now(),
            calendarFormat: CalendarFormat.month,
            currentDay: DateTime.now(),
            daysOfWeekVisible: true,
            weekNumbersVisible: false,
            shouldFillViewport: true,
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) => isSameDay(day, today),
            headerStyle: HeaderStyle(
              formatButtonShowsNext: false,
              formatButtonVisible: false,
              titleCentered: true,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.white.withOpacity(0.5), width: 0.4))),
              titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
              leftChevronIcon: Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.7),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    size: 10, color: Colors.white),
              ),
              rightChevronIcon: Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.7),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: const Icon(Icons.arrow_forward_ios_outlined,
                    size: 10, color: Colors.white),
              ),
              headerPadding: const EdgeInsets.only(bottom: 5, top: 5),
            ),
            calendarStyle: CalendarStyle(
              cellMargin:
                  const EdgeInsets.only(top: 7, bottom: 7, left: 5, right: 5),
              isTodayHighlighted: false,
              outsideDaysVisible: true,
              weekendTextStyle: const TextStyle(color: Colors.white),
              defaultTextStyle: const TextStyle(color: Colors.white),
              disabledTextStyle: const TextStyle(color: Colors.grey),
              canMarkersOverflow: false,
              selectedTextStyle: const TextStyle(color: Colors.white),
              selectedDecoration: BoxDecoration(
                color: const Color(0xffB2FF81).withOpacity(0.26),
                //  borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xffFFBFBD),
                ),
              ),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: Colors.white,
              ),
              weekendStyle: TextStyle(color: Colors.white),
            ),
            daysOfWeekHeight: 35,
          ),
        ),
      ],
    );
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  thirdPage(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Enter your name and address',
              style: TextStyleHelper.kWhite18W600Inter,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/user.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/address.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address #1',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/address.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address #2',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Country',
                style: TextStyleHelper.kWhite18W600Inter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.5),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/map.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Country',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/map.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'City',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/remarks.svg',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyleHelper.kWhite14W400Inter,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Remark',
                            hintStyle: TextStyleHelper.kWhite14W400Inter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Reason/Notes',
                style: TextStyleHelper.kWhite18W600Inter,
              ),
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Colors.white)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: TextStyleHelper.kWhite14W400Inter,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your reason here...',
                          hintStyle: TextStyleHelper.kWhite14W400Inter),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  generalDialog();
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
                    'Submit Request',
                    style: TextStyleHelper.kBG18W600Inter,
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
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
                    "Letter Request Submitted",
                    style: TextStyleHelper.kWhite22W600Inter,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Flexible(
                    child: Text(
                      "Request for the required letter has been submitted successfully",
                      textAlign: TextAlign.center,
                      style: TextStyleHelper.kWhite16W400Inter,
                    ),
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
