// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:platfrom_convter_app/controller/platformChange/platformChange.dart';
// import 'package:platfrom_convter_app/controller/switchController/switchController.dart';
// import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';
// import 'package:platfrom_convter_app/screens/cupertino/fristPage/fristPage.dart';
// import 'package:platfrom_convter_app/screens/firstPage/firstPage.dart';
//
// class AdaptiveScreen extends StatelessWidget {
//   const AdaptiveScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var themeControllerTrue = Get.put(ThemeController());
//     var platformController = Get.put(PlatfromChangeController());
//
//     bool isDark = themeControllerTrue.isDark.value;
//
//     if (platformController.platformConverter == true) {
//       return CupertinoApp(
//         debugShowCheckedModeBanner: false,
//         theme: isDark
//             ? themeControllerTrue.cupertinoThemeDark
//             : themeControllerTrue.cupertinoThemeLight,
//         home: cupertinoPage(),
//       );
//     } else {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: isDark
//             ? themeControllerTrue.themeDark
//             : themeControllerTrue.themeLight,
//         home: const firstPage(),
//       );
//     }
//   }
// }
