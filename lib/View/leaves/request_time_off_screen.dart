import 'dart:developer';

import 'package:blur/blur.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/common_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constant/text_style_helper.dart';

class RequestTimeOffScreen extends StatefulWidget {
  const RequestTimeOffScreen({Key? key}) : super(key: key);

  @override
  State<RequestTimeOffScreen> createState() => _RequestTimeOffScreenState();
}

class _RequestTimeOffScreenState extends State<RequestTimeOffScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _controller = PageController();
  DateTime today = DateTime.now();
  PlatformFile? file1;
  String fileName = '';

  List<Map<String, dynamic>> leaveList = [
    {"title": "Vacation", "days": "23 days remaining", "status": "panding"},
    {"title": "Casual", "days": "32 days remaining", "status": "panding"},
    {"title": "Sick Leave", "days": "14 days remaining", "status": "panding"},
    {
      "title": "Sick Leave No Pay",
      "days": "2 days remaining",
      "status": "Unpaid"
    },
  ];
  TextEditingController messageController = TextEditingController();
  int selectPage = 0;
  List scroll = [0];
  bool isAvilable = false;
  DateTime? selectDate1;
  bool open = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      log('Keyboard is visible');

      setState(() {
        open = true;
      });
    } else {
      setState(() {
        open = false;
      });
      log('Keyboard is not visible');
    }

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Global()
              .commonDrawer(context: context, size: size, key: _scaffoldKey),
        ),
        backgroundColor: ColorHelper.kBG,
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
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (selectPage == 0) {
                                  Get.back();
                                }
                                if (selectPage == 1) {
                                  _controller.jumpToPage(0);
                                }
                                if (selectPage == 2) {
                                  _controller.jumpToPage(1);
                                }
                              },
                              child: SvgPicture.asset(
                                'assets/icons/arrow-left-rounded.svg',
                                height: 35,
                              ),
                            ),
                            Text(
                              'Request Time Off',
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
                        height: size.height * 0.020,
                      ),
                      Expanded(
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
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
                  left: size.width / 2.35,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Row(
                        children: [
                          scroll.contains(index)
                              ? Image.asset(
                                  "assets/icons/People12.png",
                                  height: 16,
                                  width: 16,
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.025, vertical: size.height * 0.008),
        child: Column(
          children: [
            Text(
              'What type of leave do you want to take?',
              style: TextStyleHelper.kWhite18W600Inter,
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: leaveList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.008),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.jumpToPage(1);
                      });
                    },
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width * 1,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                leaveList[index]["title"],
                                style: TextStyleHelper.kWhite16W600Inter,
                              ),
                              Text(leaveList[index]["days"],
                                  style: TextStyleHelper.kWhite12w500BOLDInter),
                            ],
                          ),
                          const Spacer(),
                          leaveList[index]["status"].toString() !=
                                  "panding".toString()
                              ? Container(
                                  height: size.height * 0.040,
                                  width: size.width * 0.28,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: ColorHelper.kPrimary,
                                      borderRadius:
                                          BorderRadius.circular(32.r)),
                                  child: Text(
                                    'Unpaid',
                                    style: TextStyleHelper.kWhite14W600Inter,
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          SvgPicture.asset(
                            'assets/icons/arrow-circle-right.svg',
                            height: 25,
                            color: ColorHelper.kPrimary,
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  secondPage(Size size) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
            height: size.height * 0.4,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              // color: Colors.white.withOpacity(0.15),
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
            )),
        const Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              _controller.jumpToPage(2);
            });
          },
          child: Container(
            height: size.height * 0.057,
            width: size.width * 0.34,
            decoration: BoxDecoration(
              color: ColorHelper.kPrimary,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Continue',
                  style: TextStyleHelper.kWhite16W400Inter.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff331600)),
                ),
                const SizedBox(
                  width: 2,
                ),
                SvgPicture.asset(
                  'assets/icons/arrow-right.svg',
                  height: 25,
                  color: const Color(0xff331600),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.0684,
        )
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '11\nMay',
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.kWhite22W600Inter,
                ),
                SizedBox(
                  width: size.width * 0.020,
                ),
                Column(
                  children: [
                    Text(
                      '----------------',
                      style: TextStyleHelper.kPrimary20W600Inter,
                    ),
                    Text(
                      '2 days of sick\n leave'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyleHelper.kWhite10W500Inter,
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.020,
                ),
                Text(
                  '13\nMay',
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.kWhite22W600Inter,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.040,
            ),
            Text(
              'Message to the Employer',
              style: TextStyleHelper.kWhite16W600Inter,
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            Container(
              height: size.height * 0.15,
              width: size.width,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.r)),
              child: TextFormField(
                autofocus: false,
                maxLines: 5,
                style: TextStyle(color: ColorHelper.kLightGrey),
                scrollPadding: const EdgeInsets.symmetric(horizontal: 10),
                controller: messageController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
                  hintText: "Enter the reason for leave (optional)",
                  hintStyle: TextStyle(
                      color: ColorHelper.kLightGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.040,
            ),
            fileName.isNotEmpty
                ? const SizedBox()
                : InkWell(
                    onTap: () async {
                      final result = await FilePicker.platform.pickFiles(
                        onFileLoading: (p0) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                      if (result == null) {
                        return;
                      }
                      final file = result.files.first;

                      fileName = file.name;
                      setState(() {});
                    },
                    child: Container(
                      height: size.height * 0.0639,
                      width: size.width * 0.517,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorHelper.kPrimary,
                        ),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Attachment',
                            style: TextStyleHelper.kWhite16W400Inter.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: ColorHelper.kPrimary,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          SvgPicture.asset(
                            'assets/icons/export.svg',
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
            fileName.isNotEmpty
                ? const SizedBox()
                : SizedBox(
                    height: size.height * 0.020,
                  ),
            fileName.isNotEmpty
                ? Column(
                    children: [
                      Container(
                        height: size.height * 0.18,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.14),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/pdf.svg',
                              height: 55,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/trash.svg',
                                  height: 15,
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/eye.svg',
                                  height: 15,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              fileName,
                              style: TextStyleHelper.kWhite14W400Inter,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.040,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles(
                            onFileLoading: (p0) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                          if (result == null) {
                            return;
                          }
                          final file = result.files.first;

                          fileName = file.name;
                          setState(() {});
                        },
                        child: Container(
                          height: size.height * 0.0639,
                          width: size.width * 0.517,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorHelper.kPrimary,
                            ),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Upload Attachment',
                                style:
                                    TextStyleHelper.kWhite16W400Inter.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: ColorHelper.kPrimary,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              SvgPicture.asset(
                                'assets/icons/export.svg',
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                    ],
                  )
                : const SizedBox(),
            InkWell(
              onTap: () {
                Global().commonPopUp(title: 'Leave Request\nSubmitted');
              },
              child: Container(
                height: size.height * 0.0639,
                width: size.width * 0.517,
                decoration: BoxDecoration(
                  color: ColorHelper.kPrimary,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Submit Request',
                      style: TextStyleHelper.kWhite16W400Inter.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: const Color(0xff331600)),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    SvgPicture.asset(
                      'assets/icons/arrow-right.svg',
                      height: 25,
                      color: const Color(0xff331600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
