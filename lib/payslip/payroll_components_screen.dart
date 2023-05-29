import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/color_helper.dart';
import '../constant/text_style_helper.dart';

class PayrollComponentScreen extends StatefulWidget {
  const PayrollComponentScreen({Key? key}) : super(key: key);

  @override
  State<PayrollComponentScreen> createState() => _PayrollComponentScreenState();
}

class _PayrollComponentScreenState extends State<PayrollComponentScreen>
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

  List<Map<String, dynamic>> additions = [
    {
      'title': 'Travel',
      'price': 'AED 420',
    },
    {
      'title': 'Mobile',
      'price': 'AED 380',
    }
  ];

  List<Map<String, dynamic>> deductions = [
    {
      'title': 'Advance Salary',
      'price': 'AED 60',
      'value': 'Variable',
    },
    {
      'title': 'Credit Balance',
      'price': 'AED 340',
      'value': 'Fixed',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.kBG,
        body: Stack(
          children: [
            Positioned(
              top: -size.height * 0.15,
              left: -size.width * 0.3,
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
              top: size.height * 0.6,
              right: size.width * 0.85,
              child: Image.asset(
                'assets/icons/Finance.png',
                height: size.height * 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(clipBehavior: Clip.none, children: [
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            color: ColorHelper.kBGBlur.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(24)),
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
                                'Payroll Components',
                                style: TextStyleHelper.kPrimary22W600Inter,
                              ),
                              const SizedBox(width: 30),
                            ],
                          ),
                        ),
                        Divider(
                          height: 0,
                          thickness: 2,
                          color: ColorHelper.kPrimary,
                        ),
                        const SizedBox(
                          height: 49,
                        ),
                        Container(
                          height: size.height * 0.040,
                          margin: EdgeInsets.symmetric(
                              horizontal: size.height * 0.017),
                          decoration: BoxDecoration(
                            color: const Color(0xff2F2D29).withOpacity(0.4),
                            border: Border.all(color: ColorHelper.kDarkGrey),
                            borderRadius: BorderRadius.circular(8),
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
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffFFC091),
                                border: Border.all(color: Colors.white)),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Center(
                                child: Text(
                                  'Additions',
                                  style: TextStyleHelper.kPrimary20W600Inter
                                      .copyWith(
                                    fontSize: 14,
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
                                  'Deductions',
                                  style: TextStyleHelper.kPrimary20W600Inter
                                      .copyWith(
                                    fontSize: 14,
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
                        Expanded(
                          child:
                              TabBarView(controller: _tabController, children: [
                            Column(
                              children: List.generate(
                                2,
                                (index) => Container(
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsets.only(
                                      bottom: 16, right: 16, left: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.14),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          additions[index]['title'],
                                          style:
                                              TextStyleHelper.white14W600Inter,
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Fixed',
                                          style:
                                              TextStyleHelper.white14W400Inter,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          additions[index]['price'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: ColorHelper.kPrimary),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: List.generate(
                                2,
                                (index) => Container(
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsets.only(
                                      bottom: 16, right: 16, left: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.14),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          deductions[index]['title'],
                                          style:
                                              TextStyleHelper.white14W600Inter,
                                        ),
                                        const Spacer(),
                                        Text(
                                          deductions[index]['value'],
                                          style:
                                              TextStyleHelper.white14W400Inter,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          deductions[index]['price'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: ColorHelper.kPrimary),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
    );
  }
}
