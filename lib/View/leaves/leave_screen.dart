import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';

import '../../constant/color_helper.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  List<Map<String, dynamic>> leavesList = [
    {
      "day": '14',
      "name": "Sick Leaves",
    },
    {
      "day": "22",
      "name": "Casual Leaves",
    },
    {
      "day": "42",
      "name": "Medical Leaves",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.kBG,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.030,
                  vertical: size.height * 0.020),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: ColorHelper.kPrimary,
                    size: 24,
                  ),
                  SizedBox(
                    width: size.width * 0.35,
                  ),
                  Text(
                    'Leaves',
                    style: TextStyleHelper.kPrimary20W600Inter
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {},
            )
          ],
        ),
      ),
    );
  }
}
