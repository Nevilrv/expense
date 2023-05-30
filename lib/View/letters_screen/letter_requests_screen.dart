import 'package:blur/blur.dart';
import 'package:expense/View/letters_screen/request_letter_screens.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constant/common_widget.dart';
import '../../constant/text_style_helper.dart';

class LetterRequestsScreen extends StatefulWidget {
  const LetterRequestsScreen({Key? key}) : super(key: key);

  @override
  State<LetterRequestsScreen> createState() => _LetterRequestsScreenState();
}

class _LetterRequestsScreenState extends State<LetterRequestsScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> titles = [
    'NOC Release Letter',
    'Passport Letter',
    'Salary Transfer Letter'
  ];

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
        floatingActionButton: GestureDetector(
          onTap: () {
            Get.to(() => const RequestLetterScreens());
          },
          child: Image.asset(
            'assets/icons/floating_button.png',
            height: 69,
            width: 69,
          ),
        ),
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
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.077,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.08,
                          ),
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
                      Text(
                        'Letter Request',
                        style: TextStyle(
                            color: ColorHelper.kPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size.width * 0.08),
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Color(0xFFF7F6F5),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.248,
                        margin: EdgeInsets.all(size.width * 0.033),
                        child: Blur(
                          blur: 10,
                          colorOpacity: 0.25,
                          overlay: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Pending Request',
                                      style: TextStyleHelper.kWhite22W600Inter,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/arrow-circle-up.svg',
                                      color: ColorHelper.kPrimary,
                                      height: 21.5,
                                      width: 21.5,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.026),
                                  child: Container(
                                    padding:
                                        EdgeInsets.all(size.height * 0.018),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF)
                                            .withOpacity(0.14),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'NOC Letter',
                                          style: TextStyleHelper
                                              .kPrimary16W600Inter,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: size.width * 0.34,
                                              child: Text(
                                                'Submit Date',
                                                style: TextStyleHelper
                                                    .kWhite14W400Inter,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.34,
                                              child: Text(
                                                '20/12/2023',
                                                style: TextStyleHelper
                                                    .kWhite14W400Inter,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View more  ',
                                      style: TextStyle(
                                        color: ColorHelper.kPrimary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Inter-Bold',
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/arrow-circle-right.svg',
                                      color: ColorHelper.kPrimary,
                                      height: 14,
                                      width: 14,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(32),
                          blurColor: ColorHelper.kBGBlur,
                          child: Container(),
                        ),
                      ),
                      Container(
                        height: size.height * 0.46,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.033),
                        child: Blur(
                          blur: 10,
                          colorOpacity: 0.25,
                          overlay: Padding(
                            padding: EdgeInsets.all(size.height * 0.0285),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Request History',
                                      style: TextStyleHelper.kWhite22W600Inter,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/arrow-circle-up.svg',
                                      color: ColorHelper.kPrimary,
                                      height: 21.5,
                                      width: 21.5,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.009,
                                ),
                                ...List.generate(
                                  3,
                                  (index) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      width: size.width,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFFFFFF)
                                              .withOpacity(0.14),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                titles[index],
                                                style: TextStyleHelper
                                                    .kPrimary16W600Inter,
                                              ),
                                              SizedBox(
                                                width: size.width * 0.6,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Submit Date',
                                                      style: TextStyleHelper
                                                          .kWhite14W400Inter,
                                                    ),
                                                    Text(
                                                      '20/12/2023',
                                                      style: TextStyleHelper
                                                          .kWhite14W400Inter,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(
                                            index == 2
                                                ? 'assets/icons/close-circles.svg'
                                                : 'assets/icons/tick-circle_green.svg',
                                            height: 28,
                                            width: 28,
                                            color: index == 2
                                                ? const Color(0xFfA8200D)
                                                : const Color(0xFf9FE870),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.0159,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View more  ',
                                      style: TextStyle(
                                        color: ColorHelper.kPrimary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Inter-Bold',
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/arrow-circle-right.svg',
                                      color: ColorHelper.kPrimary,
                                      height: 14,
                                      width: 14,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(32),
                          blurColor: ColorHelper.kBGBlur,
                          child: Container(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
