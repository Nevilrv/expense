import 'package:blur/blur.dart';
import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:expense/Controller/AddDocumentsController/passport_photo_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../Common/common_button.dart';

class AddPassportPhotoScreen extends StatefulWidget {
  const AddPassportPhotoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPassportPhotoScreen> createState() => _AddPassportPhotoScreenState();
}

class _AddPassportPhotoScreenState extends State<AddPassportPhotoScreen> {
  PassportPhotoController passportPhotoController =
      Get.put(PassportPhotoController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<PassportPhotoController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorHelper.kBG,
            body: Stack(
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height * 1,
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.025,
                      vertical: size.width * 0.08),
                  child: Blur(
                    blur: 10,
                    colorOpacity: 0.25,
                    overlay: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.038,
                            vertical: size.height * 0.015,
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
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Passport Photo',
                                  style: TextStyleHelper.kPrimary20W600Inter,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
                          height: size.height * 0.027,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Attach your passport photo',
                                    textAlign: TextAlign.justify,
                                    style: TextStyleHelper.kWhite16W600Inter),
                                const SizedBox(
                                  height: 16,
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
                                                BorderRadius.circular(20.r),
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
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        ColorHelper.kPrimary),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
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
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      'Camera',
                                                      style: TextStyle(
                                                          color:
                                                              ColorHelper.kBG),
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
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      'Gallery',
                                                      style: TextStyle(
                                                          color:
                                                              ColorHelper.kBG),
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
                                  child: controller.imageFile == null
                                      ? Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: size.height * 0.052,
                                            width: size.width * 0.547,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: ColorHelper.kPrimary),
                                              borderRadius:
                                                  BorderRadius.circular(56.r),
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
                                                  'Upload (Size Limit: 1MB)',
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
                                                BorderRadius.circular(24.r),
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
                                                          alignment:
                                                              Alignment.center,
                                                          height: 21,
                                                          width: 54,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
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
                                              Text(
                                                'Photo Uploaded',
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
                                const Spacer(),
                                Align(
                                  alignment: Alignment.center,
                                  child: CommonButton().saveButton(context),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                    blurColor: ColorHelper.kBGBlur,
                    child: Container(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
