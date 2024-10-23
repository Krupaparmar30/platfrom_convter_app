import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platfrom_convter_app/controller/controller.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';

import '../iosProfile/iosProfile.dart';

class IosCall extends StatelessWidget {
  const IosCall({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlatformConverterController());
    var themeControllerTrue = Get.put(ThemeController());
    return SingleChildScrollView(
      child: CupertinoPageScaffold(
        backgroundColor: (themeControllerTrue.isDark).value
            ? CupertinoColors.black
            : CupertinoColors.white,
        child: Column(
          children: [
            ...List.generate(
              controller.data.length,
              (index) {
                return CupertinoButton(
                  child: CupertinoListTile(
                    leading: CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage(controller.ImgPath!.value),
                    ),
                    title: Text(
                      controller.data[index]['name'],
                      style: TextStyle(
                        color: (themeControllerTrue.isDark).value
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      ),
                    ),
                    subtitle: Text(
                      controller.data[index]['chat'],
                      style: TextStyle(
                        color: (themeControllerTrue.isDark).value
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      ),
                    ),
                    trailing: Icon(
                      CupertinoIcons.phone,
                      color: (themeControllerTrue.isDark).value
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                  onPressed: () {},
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
