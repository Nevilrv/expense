import 'package:flutter/material.dart';

import 'constant/color_helper.dart';

class ClipBoardScreen extends StatefulWidget {
  const ClipBoardScreen({Key? key}) : super(key: key);

  @override
  State<ClipBoardScreen> createState() => _ClipBoardScreenState();
}

class _ClipBoardScreenState extends State<ClipBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kBG,
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
    );
  }
}
