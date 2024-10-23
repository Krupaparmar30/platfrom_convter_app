import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platfrom_convter_app/controller/controller.dart';
import 'package:platfrom_convter_app/controller/platformChange/platformChange.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';
import 'package:platfrom_convter_app/screens/cupertino/fristPage/fristPage.dart';
import 'package:platfrom_convter_app/screens/firstPage/firstPage.dart';
import 'package:platfrom_convter_app/utils/adeaptiveScreen/adeptiveScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlatformConverterController());
    var themeControllerTrue = Get.put(ThemeController());
    var platfromChangeController = Get.put(PlatfromChangeController());
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:
            themeControllerTrue.isDark.value ? ThemeMode.dark : ThemeMode.light,
        home: platfromChangeController.platformConverter.value
            ? cupertinoPage()
            : firstPage(),
      ),
    );
  }
}
