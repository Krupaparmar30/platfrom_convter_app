import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platfrom_convter_app/controller/controller.dart';
import 'package:platfrom_convter_app/controller/platformChange/platformChange.dart';
import 'package:platfrom_convter_app/controller/switchController/switchController.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';
import 'package:platfrom_convter_app/screens/callPage/callPage.dart';
import 'package:platfrom_convter_app/screens/chatPage/chatPage.dart';
import 'package:platfrom_convter_app/screens/profilePage/profilePage.dart';

import '../profile_screen/profile_screen.dart';

class firstPage extends StatelessWidget {
  const firstPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlatformConverterController());
    var themeControllerTrue = Get.put(ThemeController());
    var switchTrue = Get.put(SwitchController());
    var platformController = Get.put(PlatfromChangeController());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor:
            (themeControllerTrue.isDark).value ? Colors.white : Colors.black,
        appBar: AppBar(
          backgroundColor:
              (themeControllerTrue.isDark).value ? Colors.black : Colors.white,
          title: Text(
            "Platform Converter",
            style: TextStyle(
                color: (themeControllerTrue.isDark).value
                    ? Colors.white
                    : Colors.black),
          ),
          bottom: const TabBar(tabs: [
            Tab(
              child: Icon(Icons.person),
            ),
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
              child: Text("CALLS"),
            ),
            Tab(
              child: Text('SETTINGS'),
            )
          ]),
          actions: [
            Obx(
              () => Switch(
                activeColor: (themeControllerTrue.isDark.value)
                    ? Colors.green
                    : Colors.green,
                value: platformController.platformConverter.value,
                onChanged: (value) {
                  platformController.platformConverter.value = value;
                },
              ),
            )
          ],
        ),
        body: TabBarView(children: [
          profilePage(),
          chatPage(),
          callPage(),
          profileScreen(),
        ]),
      ),
    );
  }
}

// Container(
// height: 100,
// width: 400,
// color: (themeControllerTrue.isDark).value
// ? Theme.of(context).colorScheme.secondary
//     : Theme.of(context).colorScheme.primary,
// child: ListTile(
// leading: Icon(
// Icons.sunny,
// color: (themeControllerTrue.isDark).value
// ? Theme.of(context).colorScheme.primary
//     : Theme.of(context).colorScheme.secondary,
// size: 30,
// ),
// title: Text(
// "Theme",
// style: TextStyle(
// color: (themeControllerTrue.isDark).value
// ? Theme.of(context).colorScheme.primary
//     : Theme.of(context).colorScheme.secondary,
// ),
// ),
// subtitle: Text(
// "Change Theme",
// style: TextStyle(
// color: (themeControllerTrue.isDark).value
// ? Theme.of(context).colorScheme.primary
//     : Theme.of(context).colorScheme.secondary,
// ),
// ),
// trailing: Obx(
// () => Switch(
// value: themeControllerTrue.isDark.value,
// onChanged: (value) {
// themeControllerTrue.toggleTheme();
// },
// ),
// ),
// ),
// ),
