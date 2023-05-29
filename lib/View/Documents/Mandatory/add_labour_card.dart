import 'dart:ui';

import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

import '../Common/CommonDialog.dart';

class AddLabourCardScreen extends StatefulWidget {
  const AddLabourCardScreen({Key? key}) : super(key: key);

  @override
  State<AddLabourCardScreen> createState() => _AddLabourCardScreenState();
}

class _AddLabourCardScreenState extends State<AddLabourCardScreen> {
  DateTime labourCardExpiryDate = DateTime.now();
  DateTime labourCardDate = DateTime.now();
  String? dropDownValue;
  String? dropDownValue1;

  PlatformFile? file1;
  String fileName = '';

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
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.042,
                ),
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
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.025,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13),
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
                                  'Labour Card',
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
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ///First Name
                                  Text(
                                    'First Name',
                                    style: TextStyleHelper.white16W600Inter,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      style: TextStyleHelper.kWhite14W400Inter,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 16,
                                  ),

                                  ///last Name
                                  Text(
                                    'Last Name',
                                    style: TextStyleHelper.white16W600Inter,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      style: TextStyleHelper.kWhite14W400Inter,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 16,
                                  ),

                                  ///Labour Card No..
                                  Text(
                                    'Labour Card No.',
                                    style: TextStyleHelper.white16W600Inter,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      style: TextStyleHelper.kWhite14W400Inter,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 16,
                                  ),

                                  ///Labour Designation
                                  Text(
                                    'Labour Designation',
                                    style: TextStyleHelper.white16W600Inter,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      style: TextStyleHelper.kWhite14W400Inter,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 16,
                                  ),

                                  ///Issue Date
                                  Text(
                                    'Issue Date',
                                    style: TextStyleHelper.white16W600Inter,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Row(
                                      children: [
                                        Text(
                                            DateFormat.yMd()
                                                .format(labourCardDate),
                                            style: TextStyleHelper
                                                .kWhite14W400Inter),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () async {
                                            final DateTime? picked =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: labourCardDate,
                                              firstDate: DateTime(2015, 8),
                                              lastDate: DateTime(2101),
                                              builder: (context, child) {
                                                return Theme(
                                                  data: ThemeData(
                                                    splashColor: Colors.white,
                                                    colorScheme:
                                                        ColorScheme.light(
                                                      primary:
                                                          ColorHelper.kPrimary,
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
                                                picked != labourCardDate) {
                                              setState(() {
                                                labourCardDate = picked;
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

                                  ///Expiry Date
                                  Text(
                                    'Expiry Date',
                                    style: TextStyleHelper.white16W600Inter,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Row(
                                      children: [
                                        Text(
                                            DateFormat.yMd()
                                                .format(labourCardExpiryDate),
                                            style: TextStyleHelper
                                                .kWhite14W400Inter),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () async {
                                            final DateTime? picked =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: labourCardExpiryDate,
                                              firstDate: DateTime(2015, 8),
                                              lastDate: DateTime(2101),
                                              builder: (context, child) {
                                                return Theme(
                                                  data: ThemeData(
                                                    splashColor: Colors.white,
                                                    colorScheme:
                                                        ColorScheme.light(
                                                      primary:
                                                          ColorHelper.kPrimary,
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
                                                picked !=
                                                    labourCardExpiryDate) {
                                              setState(() {
                                                labourCardExpiryDate = picked;
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

                                  ///Attach your Document
                                  Text(
                                    'Attach your Document',
                                    style: TextStyleHelper.white16W600Inter,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  GestureDetector(
                                    onTap: () async {
                                      final result =
                                          await FilePicker.platform.pickFiles(
                                        onFileLoading: (p0) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      );
                                      if (result == null) return;
                                      final file = result.files.first;
                                      fileName = file.name;
                                      file1 = file;
                                      setState(() {});
                                    },
                                    child: fileName.isEmpty
                                        ? Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: size.height * 0.052,
                                              width: size.width * 0.547,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        ColorHelper.kPrimary),
                                                borderRadius:
                                                    BorderRadius.circular(56),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/export.svg'),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Upload (Size Limit: 5MB)',
                                                    style: TextStyleHelper
                                                        .kPrimary12W500Inter,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/icons/file.svg'),
                                                        Positioned(
                                                          top: 20,
                                                          bottom: 20,
                                                          left: -3,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 21,
                                                            width: 54,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: const Text(
                                                                'JPEG',
                                                                style: TextStyle(
                                                                    fontSize: 9,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        final result =
                                                            await FilePicker
                                                                .platform
                                                                .pickFiles(
                                                          onFileLoading: (p0) {
                                                            return const Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            );
                                                          },
                                                        );
                                                        if (result == null) {
                                                          return;
                                                        }
                                                        final file =
                                                            result.files.first;

                                                        fileName = file.name;

                                                        setState(() {});
                                                      },
                                                      child: SvgPicture.asset(
                                                          'assets/icons/change.svg'),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        openFile(file1!);
                                                      },
                                                      child: SvgPicture.asset(
                                                          'assets/icons/eye.svg'),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  fileName,
                                                  style: TextStyleHelper
                                                      .kWhite14W400Inter,
                                                )
                                              ],
                                            ),
                                          ),
                                  ),

                                  const SizedBox(
                                    height: 16,
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      AddDocumentDialog().generalDialog();
                                    },
                                    child: Align(
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
                                                color: Colors.white
                                                    .withOpacity(0.25),
                                                spreadRadius: 0,
                                                blurRadius: 10,
                                                offset: const Offset(0.0, 4.0))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Save',
                                          style: TextStyleHelper.kBG18W600Inter,
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 36),
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

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
