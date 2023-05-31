import 'dart:developer';

import 'package:expense/Controller/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/color_helper.dart';
import 'constant/common_widget.dart';
import 'constant/text_style_helper.dart';

class ClipBoardScreen extends StatefulWidget {
  const ClipBoardScreen({Key? key}) : super(key: key);

  @override
  State<ClipBoardScreen> createState() => _ClipBoardScreenState();
}

class _ClipBoardScreenState extends State<ClipBoardScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DrawerGetController drawerGetController = Get.put(DrawerGetController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorHelper.kBG,
        onDrawerChanged: (val) {
          drawerGetController.setDrawer(val);
          log("isDrawer---${drawerGetController.isDrawer}");
        },
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: size.height * 0.025,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: ColorHelper.kPrimary,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.3,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ClipBoard',
                    style: TextStyleHelper.kPrimary22W600Inter
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: ColorHelper.kBG.withOpacity(0.9),
          child: Global()
              .commonDrawer(context: context, size: size, key: _scaffoldKey),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(
              child: Text(
                "ClipBoard Screen",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
