import 'dart:developer';

import 'package:blur/blur.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constant/text_style_helper.dart';

class RequestTimeOffScreen extends StatefulWidget {
  const RequestTimeOffScreen({Key? key}) : super(key: key);

  @override
  State<RequestTimeOffScreen> createState() => _RequestTimeOffScreenState();
}

class _RequestTimeOffScreenState extends State<RequestTimeOffScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _controller = PageController();

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.030,
                    ),
                    InkWell(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.08),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.menu,
                            color: Color(0xff260A2F),
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                        padding: const EdgeInsets.all(20),
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
                  borderRadius: BorderRadius.circular(30),
                  blurColor: ColorHelper.kBGBlur,
                  child: Container(),
                ),
              ),
            ),
            Positioned(
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
                  child: Container(
                    height: size.height * 0.1,
                    width: size.width * 1,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20)),
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
                                    color: const Color(0xffEDC843)
                                        .withOpacity(0.50),
                                    borderRadius: BorderRadius.circular(32)),
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
            borderRadius: BorderRadius.circular(16),
          ),
          child: TableCalendar(
              focusedDay: selectDate1 ?? DateTime.now(),
              firstDay: DateTime(2000),
              lastDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              currentDay: DateTime.now(),
              daysOfWeekVisible: true,
              weekNumbersVisible: false,
              shouldFillViewport: true,
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
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 0.7)),
                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                      size: 10, color: Colors.white),
                ),
                rightChevronIcon: Container(
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 0.7)),
                  child: const Icon(Icons.arrow_forward_ios_outlined,
                      size: 10, color: Colors.white),
                ),
                headerPadding: const EdgeInsets.only(bottom: 5, top: 5),
              ),
              calendarStyle: CalendarStyle(
                cellMargin:
                    const EdgeInsets.only(top: 7, bottom: 7, left: 5, right: 5),
                isTodayHighlighted: true,
                outsideDaysVisible: true,
                todayTextStyle: const TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                    color: const Color(0xffB2FF81).withOpacity(0.26),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    border: Border.all(color: const Color(0xffFFBFBD))),
                weekendTextStyle: const TextStyle(color: Colors.white),
                defaultTextStyle: const TextStyle(color: Colors.white),
                disabledTextStyle: const TextStyle(color: Colors.grey),
                canMarkersOverflow: false,
                selectedTextStyle: const TextStyle(color: Colors.white),
                selectedDecoration: BoxDecoration(
                  color: const Color(0xffB2FF81).withOpacity(0.26),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
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
              onPageChanged: (focusedDay) {
                selectDate1 = focusedDay;
                setState(() {});
              },
              onDaySelected: (selectedDay, selectDate) {
                log('DAY $selectedDay');
                log('DATE $selectDate');
                log('DATE $selectDate1');

                setState(() {
                  selectDate1 = selectDate;
                });
              }),
        ),
      ],
    );
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
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                autofocus: false,
                maxLines: 5,
                style: TextStyle(color: ColorHelper.textColor),
                scrollPadding: const EdgeInsets.symmetric(horizontal: 10),
                controller: messageController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
                  hintText: "Enter the reason for leave (optional)",
                  hintStyle: TextStyle(
                      color: ColorHelper.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
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
            isAvilable == true
                ? const SizedBox()
                : InkWell(
                    onTap: () {
                      setState(() {
                        isAvilable = true;
                      });
                    },
                    child: Container(
                      height: size.height * 0.057,
                      width: size.width * 0.50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorHelper.kPrimary,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Attachment',
                            style: TextStyleHelper.kWhite16W400Inter.copyWith(
                              fontWeight: FontWeight.w600,
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
            isAvilable == true
                ? Column(
                    children: [
                      Container(
                        height: size.height * 0.18,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.14),
                          borderRadius: BorderRadius.circular(15),
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
                              'Uploaded_doc.pdf',
                              style: TextStyleHelper.kWhite14W400Inter,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.040,
                      ),
                      Container(
                        height: size.height * 0.057,
                        width: size.width * 0.50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorHelper.kPrimary,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Attachment',
                              style: TextStyleHelper.kWhite16W400Inter.copyWith(
                                fontWeight: FontWeight.w600,
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
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      InkWell(
                        onTap: () {
                          Global()
                              .commonPopUp(title: 'Leave Request Submitted');
                        },
                        child: Container(
                          height: size.height * 0.057,
                          width: size.width * 0.50,
                          decoration: BoxDecoration(
                            color: ColorHelper.kPrimary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Submit Request',
                                style: TextStyleHelper.kWhite16W400Inter
                                    .copyWith(
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
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}