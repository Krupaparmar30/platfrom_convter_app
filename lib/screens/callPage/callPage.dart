import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platfrom_convter_app/controller/controller.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';

import '../profilePage/profilePage.dart';

class callPage extends StatefulWidget {
  const callPage({super.key});

  @override
  State<callPage> createState() => _callPageState();
}

class _callPageState extends State<callPage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlatformConverterController());
    var themeControllerTrue = Get.put(ThemeController());
    return Scaffold(
      backgroundColor:
          (themeControllerTrue.isDark).value ? Colors.black : Colors.white,
      body: Obx(
        () => ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: FileImage(controller.ImgPath!.value),
            ),
            title: Text(
              controller.data[index]['name'],
              style: TextStyle(
                color: (themeControllerTrue.isDark).value
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            subtitle: Text(
              controller.data[index]['chat'],
              style: TextStyle(
                color: (themeControllerTrue.isDark).value
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            trailing: Icon(Icons.call),
          ),
        ),
      ),
    );
  }
}
