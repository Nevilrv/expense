import 'package:expense/constant/common_widget.dart';
import 'package:flutter/material.dart';

import 'constant/color_helper.dart';
import 'constant/text_style_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.kBG,
        key: _scaffoldKey,
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
                  width: size.width * 0.34,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Home',
                    style: TextStyleHelper.kPrimary22W600Inter
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: Global()
              .commonDrawer(context: context, size: size, key: _scaffoldKey),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(
              child: Text(
                "Home Screen",
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
