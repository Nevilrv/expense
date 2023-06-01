///Container1
// ClipRRect(
// borderRadius: BorderRadius.circular(30.r),
// child: Padding(
// padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
// child: Padding(
// padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(
// height: size.height * 0.011,
// ),
// Align(
// alignment: Alignment.center,
// child: Text(
// "Clocked-in at",
// style: TextStyleHelper.kPrimary12W500Inter,
// ),
// ),
// SizedBox(
// height: size.height * 0.005,
// ),
// Align(
// alignment: Alignment.center,
// child: Text(
// controller.timeFormat
//     .format(DateTime.parse(controller.clockIn)),
// style: const TextStyle(
// fontSize: 32,
// color: Colors.white,
// fontWeight: FontWeight.w700,
// fontFamily: 'Inter-Medium',
// )),
// ),
// SizedBox(
// height: size.height * 0.010,
// ),
// Align(
// alignment: Alignment.center,
// child: Text(
// controller.dateFormat
//     .format(DateTime.parse(controller.clockIn)),
// style: const TextStyle(
// fontSize: 12,
// color: Colors.white,
// fontWeight: FontWeight.w400,
// fontFamily: 'Inter',
// )),
// ),
// SizedBox(
// height: size.height * 0.020,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 40),
// child: Divider(
// height: 0,
// thickness: 1,
// color: ColorHelper.kPrimary,
// ),
// ),
// SizedBox(
// height: size.height * 0.015,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Icon(
// Iconsax.location,
// color: ColorHelper.kPrimary,
// size: 20,
// ),
// SizedBox(
// width: size.width * 0.028,
// ),
// Text(
// "The Pods - Blue Waters",
// style: TextStyleHelper.kWhite14W600Inter,
// ),
// ],
// ),
// SizedBox(
// height: size.height * 0.015,
// ),
// SlideAction(
// key: _container2Key,
// onSubmit: () {
// Future.delayed(const Duration(seconds: 1), () {
// _container2Key.currentState?.reset();
// controller.Container2 = false;
// controller.Container3 = true;
// controller.clockOut = '${DateTime.now()}';
// controller.updateMethod();
// setState(() {});
// });
// },
// height: size.height * 0.067,
// borderRadius: 30,
// sliderButtonIcon: Container(
// height: size.height * 0.056,
// width: size.width * 0.11,
// decoration: const BoxDecoration(
// color: Color(0xFF211F1D), shape: BoxShape.circle),
// child: Center(
// child: Icon(
// Iconsax.timer_pause,
// color: ColorHelper.kPrimary,
// size: 24,
// )),
// ),
// outerColor: ColorHelper.kPrimary,
// text: 'Slide to Clock-Out',
// textStyle: TextStyleHelper.kPrimary18W600Inter
//     .copyWith(color: ColorHelper.fontColor),
// sliderButtonIconPadding: 0,
// innerColor: Colors.transparent,
// sliderButtonYOffset: -5,
// submittedIcon: Icon(
// Icons.check_circle_outline,
// size: 35,
// color: ColorHelper.fontColor,
// ),
// ),
// ],
// ),
// ),
// ),
// )

/// Container2
// ClipRRect(
// borderRadius: BorderRadius.circular(30.r),
// child: Padding(
// padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
// child: Padding(
// padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(
// height: size.height * 0.011,
// ),
// Align(
// alignment: Alignment.center,
// child: Text(
// "Clocked-out at",
// style: TextStyleHelper.kPrimary12W500Inter,
// ),
// ),
// SizedBox(
// height: size.height * 0.005,
// ),
// Align(
// alignment: Alignment.center,
// child: Text(
// controller.timeFormat
//     .format(DateTime.parse(controller.clockOut)),
// style: const TextStyle(
// fontSize: 32,
// color: Colors.white,
// fontWeight: FontWeight.w700,
// fontFamily: 'Inter-Medium',
// )),
// ),
// SizedBox(
// height: size.height * 0.010,
// ),
// Align(
// alignment: Alignment.center,
// child: Text(
// controller.dateFormat
//     .format(DateTime.parse(controller.clockOut)),
// style: const TextStyle(
// fontSize: 12,
// color: Colors.white,
// fontWeight: FontWeight.w400,
// fontFamily: 'Inter',
// )),
// ),
// SizedBox(
// height: size.height * 0.020,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 40),
// child: Divider(
// height: 0,
// thickness: 1,
// color: ColorHelper.kPrimary,
// ),
// ),
// SizedBox(
// height: size.height * 0.015,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Icon(
// Iconsax.location,
// color: ColorHelper.kPrimary,
// size: 20,
// ),
// SizedBox(
// width: size.width * 0.028,
// ),
// Text(
// "The Pods - Blue Waters",
// style: TextStyleHelper.kWhite14W600Inter,
// ),
// ],
// ),
// SizedBox(
// height: size.height * 0.015,
// ),
// SlideAction(
// key: _container3Key,
// onSubmit: () {
// Future.delayed(const Duration(seconds: 1), () {
// _container3Key.currentState?.reset();
// controller.Container3 = false;
// controller.Container4 = true;
// controller.clockIn1 = '${DateTime.now()}';
// controller.updateMethod();
// setState(() {});
// });
// },
// height: size.height * 0.067,
// borderRadius: 30,
// sliderButtonIcon: Container(
// height: size.height * 0.056,
// width: size.width * 0.11,
// decoration: const BoxDecoration(
// color: Color(0xFF211F1D), shape: BoxShape.circle),
// child: Center(
// child: Icon(
// Iconsax.timer_pause,
// color: ColorHelper.kPrimary,
// size: 24,
// )),
// ),
// outerColor: ColorHelper.kPrimary,
// text: 'Slide to Clock-In',
// textStyle: TextStyleHelper.kPrimary18W600Inter
//     .copyWith(color: ColorHelper.fontColor),
// sliderButtonIconPadding: 0,
// innerColor: Colors.transparent,
// sliderButtonYOffset: -5,
// submittedIcon: Icon(
// Icons.check_circle_outline,
// size: 35,
// color: ColorHelper.fontColor,
// ),
// ),
// ],
// ),
// ),
// ),
// )
