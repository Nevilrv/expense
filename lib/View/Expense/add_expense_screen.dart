import 'package:blur/blur.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../constant/color_helper.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime expenseDate = DateTime.now();
  DateTime reimbursementDate = DateTime.now();
  String? dropDownValue;

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
              Container(
                height: size.height * 1.12,
                margin: EdgeInsets.all(size.width * 0.025),
                child: Blur(
                  blur: 10,
                  colorOpacity: 0.25,
                  overlay: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
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
                              'Add Expense',
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
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Enter Expense Details',
                          style: TextStyleHelper.kWhite18W600Inter,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Expense Type
                              Text(
                                'Expense Type',
                                style: TextStyleHelper.kWhite18W600Inter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.white)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/wallet.svg',
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        cursorColor: Colors.white,
                                        style:
                                            TextStyleHelper.kWhite14W400Inter,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 16,
                              ),

                              ///Expense Date
                              Text(
                                'Expense Date',
                                style: TextStyleHelper.kWhite18W600Inter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.white)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/calendar.svg',
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(DateFormat.yMd().format(expenseDate),
                                        style:
                                            TextStyleHelper.kWhite14W400Inter),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: expenseDate,
                                          firstDate: DateTime(2015, 8),
                                          lastDate: DateTime(2101),
                                          builder: (context, child) {
                                            return Theme(
                                              data: ThemeData(
                                                splashColor: Colors.white,
                                                colorScheme: ColorScheme.light(
                                                  primary: ColorHelper.kPrimary,
                                                  onSurface: Colors.white,
                                                ),
                                                dialogBackgroundColor:
                                                    ColorHelper.kBG,
                                              ),
                                              child: child!,
                                            );
                                          },
                                        );
                                        if (picked != null &&
                                            picked != expenseDate) {
                                          setState(() {
                                            expenseDate = picked;
                                          });
                                        }
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

                              ///Receipt Number
                              Text(
                                'Receipt Number',
                                style: TextStyleHelper.kWhite18W600Inter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.white)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/receipt-2.svg',
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        cursorColor: Colors.white,
                                        style:
                                            TextStyleHelper.kWhite14W400Inter,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 16,
                              ),

                              ///Amount
                              Text(
                                'Amount',
                                style: TextStyleHelper.kWhite18W600Inter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.white)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/calculator.svg',
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        cursorColor: Colors.white,
                                        keyboardType: TextInputType.number,
                                        style:
                                            TextStyleHelper.kWhite14W400Inter,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 16,
                              ),

                              ///Currency
                              Text(
                                'Currency',
                                style: TextStyleHelper.kWhite18W600Inter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.white)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButton(
                                        dropdownColor: ColorHelper.kBG,
                                        borderRadius: BorderRadius.circular(15),
                                        underline: const SizedBox(),
                                        icon: SvgPicture.asset(
                                          'assets/icons/arrow-circle-down.svg',
                                          height: 22,
                                          color: Colors.white,
                                        ),
                                        hint: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/trade.svg',
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                                dropDownValue == null
                                                    ? 'Select Currency'
                                                    : dropDownValue!,
                                                style: TextStyleHelper
                                                    .kWhite14W400Inter),
                                          ],
                                        ),
                                        isExpanded: true,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        items: [
                                          'ADA',
                                          'AED',
                                          'BNB',
                                          'BTC',
                                          'ETH',
                                          'SOL',
                                          'XRP',
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

                              ///Reimbursement Date
                              Text(
                                'Reimbursement Date',
                                style: TextStyleHelper.kWhite18W600Inter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.white)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/calendar.svg',
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        DateFormat.yMd()
                                            .format(reimbursementDate),
                                        style:
                                            TextStyleHelper.kWhite14W400Inter),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: reimbursementDate,
                                          firstDate: DateTime(2015, 8),
                                          lastDate: DateTime(2101),
                                          builder: (context, child) {
                                            return Theme(
                                              data: ThemeData(
                                                splashColor: Colors.white,
                                                colorScheme: ColorScheme.light(
                                                  primary: ColorHelper.kPrimary,
                                                  onSurface: Colors.white,
                                                ),
                                                dialogBackgroundColor:
                                                    ColorHelper.kBG,
                                              ),
                                              child: child!,
                                            );
                                          },
                                        );
                                        if (picked != null &&
                                            picked != reimbursementDate) {
                                          setState(() {
                                            reimbursementDate = picked;
                                          });
                                        }
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

                              ///Remarks
                              Text(
                                'Remarks',
                                style: TextStyleHelper.kWhite18W600Inter,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 120,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
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
                                        style:
                                            TextStyleHelper.kWhite14W400Inter,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'Enter your reason here...',
                                            hintStyle: TextStyleHelper
                                                .kWhite14W400Inter),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Continue',
                                    style: TextStyleHelper.kBG18W600Inter,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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
}
