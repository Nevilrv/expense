import 'package:blur/blur.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/text_style_helper.dart';

class ExpenseViewMoreScreen extends StatefulWidget {
  const ExpenseViewMoreScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseViewMoreScreen> createState() => _ExpenseViewMoreScreenState();
}

class _ExpenseViewMoreScreenState extends State<ExpenseViewMoreScreen>
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

  List<Map<String, dynamic>> expense = [
    {'name': 'Medical', 'price': 'AED 60'},
    {'name': 'Fuel', 'price': 'AED 110'},
    {'name': 'Mobile Data', 'price': 'AED 42'},
  ];

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
              Container(
                height: size.height * 1.12,
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.025,
                    vertical: size.width * 0.08),
                child: Blur(
                  blur: 10,
                  colorOpacity: 0.25,
                  overlay: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
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
                              'Expense',
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
                      const SizedBox(
                        height: 28,
                      ),
                      Container(
                        height: size.height * 0.040,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorHelper.kDarkGrey),
                            color: const Color(0xff2F2D29).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8)),
                        child: TabBar(
                          controller: _tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          onTap: (value) {
                            setState(() {
                              index = value;
                            });
                          },
                          // give the indicator a decoration (color and border radius)
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffFFC091),
                              border: Border.all(color: Colors.white)),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Center(
                              child: Text(
                                'Pending',
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
                                'Approved',
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
                        height: 16,
                      ),
                      SizedBox(
                        height: size.height * 0.68,
                        // color: Colors.red,
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _tabController,
                            children: [
                              // first tab bar view widget
                              pendingExpenseMethod(size),
                              approvedExpenseMethod(size),
                            ]),
                      ),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  blurColor: ColorHelper.kBGBlur,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pendingExpenseMethod(Size size) {
    return Column(
      children: List.generate(
        expense.length,
        (index) => Container(
          width: size.width,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                      '${expense[index]['name']}',
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
                Text(
                  '${expense[index]['price']}',
                  style: TextStyleHelper.kLightGrey16W600Inter,
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
                      'Expense Date:',
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
        ),
      ),
    );
  }

  approvedExpenseMethod(Size size) {
    return Column(
      children: List.generate(
          2,
          (index) => Container(
                width: size.width,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                            '${expense[index]['name']}',
                            style: TextStyleHelper.kLightGrey16W600Inter,
                          ),
                          const Spacer(),
                          Text(
                            expense[index]['price'],
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
                              Text('VIEW REMARKS',
                                  style: TextStyleHelper.kWhite10W700Inter),
                              SvgPicture.asset(
                                  'assets/icons/arrow-circle-down.svg')
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
