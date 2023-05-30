import 'package:expense/constant/color_helper.dart';
import 'package:expense/constant/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/common_widget.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  List<Map<String, dynamic>> team = [
    {
      'name': 'Ramsey Joseph',
      'work': 'Ui/Ux Designer',
      'image': 'assets/icons/Frame 417.svg'
    },
    {
      'name': 'Bonnie Barstow',
      'work': 'Ui/Ux Designer',
      'image': 'assets/icons/Group 33327.svg'
    },
    {
      'name': 'Kate Tanner',
      'work': 'Ui/Ux Designer',
      'image': 'assets/icons/Frame 1925.svg'
    },
    {
      'name': 'Kate Tanner',
      'work': 'Ui/Ux Designer',
      'image': 'assets/icons/Frame 1925.svg'
    },
    {
      'name': 'Templeton Peck',
      'work': 'Ui/Ux Designer',
      'image': 'assets/icons/Frame 594.svg'
    },
    {
      'name': 'Tony Danza',
      'work': 'Ui/Ux Designer',
      'image': 'assets/icons/Frame 2452.svg'
    },
    {
      'name': 'Grisha Mihawk',
      'work': 'Ui/Ux Designer',
      'image': 'assets/icons/Group 33321.svg'
    },
    {
      'name': 'Arlet Jaeger',
      'work': 'Ui/Ux Designer',
      'image': 'assets/icons/Frame 417.svg'
    },
    {
      'name': 'Carly John',
      'work': 'Ui/Ux Designer',
      'image': 'assets/icons/Frame 2452.svg'
    },
  ];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorHelper.kBG,
      drawer: Drawer(
        child: Global()
            .commonDrawer(context: context, size: size, key: _scaffoldKey),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.0291),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.0673,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: SvgPicture.asset('assets/icons/menu.svg')),
                Text(
                  'Team',
                  style: TextStyleHelper.kWhite22W600Inter,
                ),
                SvgPicture.asset('assets/icons/search-normal.svg')
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: size.height * 0.237,
                  width: size.width * 0.304,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFD6D6).withOpacity(.16),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        team[index]['image'],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xff260b3b).withOpacity(0.0),
                                const Color(0xff260b3b).withOpacity(0.44),
                                const Color(0xff260b3b).withOpacity(0.64),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Remsey Joseph',
                              style: TextStyleHelper.kWhite16W700Inter,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Ui/Ux Designer',
                              style: TextStyleHelper.kPrimary12W500Inter,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
