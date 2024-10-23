import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platfrom_convter_app/controller/platformChange/platformChange.dart';
import 'package:platfrom_convter_app/controller/switchController/switchController.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';
import 'package:platfrom_convter_app/screens/cupertino/IosCall/IosCall.dart';
import 'package:platfrom_convter_app/screens/cupertino/IosChats/IosChats.dart';
import 'package:platfrom_convter_app/screens/cupertino/IosSetting/IosSetting.dart';
import 'package:platfrom_convter_app/screens/cupertino/iosProfile/iosProfile.dart';

class cupertinoPage extends StatelessWidget {
  const cupertinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var switchController = Get.put(SwitchController());
    var themeControllerTrue = Get.put(ThemeController());
    var platformController = Get.put(PlatfromChangeController());

    return CupertinoPageScaffold(
        backgroundColor: (themeControllerTrue.isDark).value
            ? CupertinoColors.black
            : CupertinoColors.white,
        navigationBar: CupertinoNavigationBar(
          middle: Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "PlatForm Converter",
                  ),
                ),
              ],
            ),
          ),
          trailing: Obx(
            () => CupertinoSwitch(
              value: platformController.platformConverter.value,
              onChanged: (value) {
                platformController.platformConverter.value = value;
              },
            ),
          ),
        ),

        /* CupertinoNavigationBar(
            middle: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "PlatForm Converter",
                  // style: TextStyle(fontSize: 20),
                ),
                // Switch(
                //   value: switchController.isActive.value,
                //   onChanged: (value) {
                //     switchController.isChange(value);
                //   },
                // ),
              ],
            ),
          ),*/
        child: CupertinoTabScaffold(
          backgroundColor: (themeControllerTrue.isDark).value
              ? CupertinoColors.black
              : CupertinoColors.white,
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_2), label: "Chat"),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone),
                label: 'Call',
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: "Setting")
            ],
          ),
          tabBuilder: (context, index) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                switch (index) {
                  case 0:
                    return IosProfile();
                    break;
                  case 1:
                    return IosChats();
                    break;
                  case 2:
                    return IosCall();
                    break;
                  case 3:
                    return IosSetting();
                    break;
                  default:
                    return Container();
                }
              },
            );
          },
        ));
  }
}
