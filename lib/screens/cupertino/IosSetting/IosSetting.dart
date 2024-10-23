import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platfrom_convter_app/controller/profile_controller/profile_controller.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';

class IosSetting extends StatelessWidget {
  const IosSetting({super.key});

  @override
  Widget build(BuildContext context) {
    var proController = Get.put(ProfileController());
    var themeControllerTrue = Get.put(ThemeController());

    return SingleChildScrollView(
      child: Obx(
        () => CupertinoPageScaffold(
          backgroundColor: (themeControllerTrue.isDark).value
              ? CupertinoColors.black
              : CupertinoColors.white,
          child: Container(
            height: 900,
            child: Column(children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoListTile(
                  leading: Icon(
                    CupertinoIcons.person,
                    color: (themeControllerTrue.isDark).value
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      color: (themeControllerTrue.isDark).value
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                  subtitle: Text(
                    'Update Profile ',
                    style: TextStyle(
                      color: (themeControllerTrue.isDark).value
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                  trailing: Obx(
                    () => CupertinoSwitch(
                      value: proController.isProfile.value,
                      onChanged: (value) {
                        proController.isProfile.value = value;
                      },
                    ),
                  ),
                ),
              ),
              if (proController.isProfile.value)
                Column(
                  children: [
                    // InkWell(onTap: () {
                    //   proController.profileImageGet();
                    // }, child: Obx(() {
                    //   return CircleAvatar(
                    //       radius: 60,
                    //       backgroundImage: proController.profileImage.value !=
                    //               null
                    //           ? FileImage(proController.profileImage.value!)
                    //           : NetworkImage(
                    //               "https://static.vecteezy.com/system/resources/thumbnails/009/273/280/small/concept-of-loneliness-and-disappointment-in-love-sad-man-sitting-element-of-the-picture-is-decorated-by-nasa-free-photo.jpg"));
                    // })),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CupertinoTextField(
                          controller: proController.txtFullName,
                          placeholder: 'Enter your name...',
                          placeholderStyle: TextStyle(
                            color: (themeControllerTrue.isDark).value
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          ),
                          style: TextStyle(
                            color: (themeControllerTrue.isDark).value
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: (themeControllerTrue.isDark).value
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoTextField(
                        controller: proController.txtBio,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: (themeControllerTrue.isDark).value
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        placeholder: 'Enter your Bio..',
                        placeholderStyle: TextStyle(
                          color: (themeControllerTrue.isDark).value
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                        style: TextStyle(
                          color: (themeControllerTrue.isDark).value
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: Row(
                        children: [
                          CupertinoButton(
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                color: (themeControllerTrue.isDark).value
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          CupertinoButton(
                            child: Text(
                              'CLEAR',
                              style: TextStyle(
                                color: (themeControllerTrue.isDark).value
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              // Obx(
              //   () => CircleAvatar(
              //       radius: 60,
              //       backgroundImage: proController.profileImage.value != null
              //           ? FileImage(proController.profileImage.value!)
              //           : NetworkImage(
              //               "https://static.vecteezy.com/system/resources/thumbnails/009/273/280/small/concept-of-loneliness-and-disappointment-in-love-sad-man-sitting-element-of-the-picture-is-decorated-by-nasa-free-photo.jpg")),
              // ),

              CupertinoListTile(
                leading: Icon(
                  CupertinoIcons.sun_max,
                  color: (themeControllerTrue.isDark).value
                      ? CupertinoColors.white
                      : CupertinoColors.black,
                ),
                title: Text(
                  'Theme',
                  style: TextStyle(
                    color: (themeControllerTrue.isDark).value
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                ),
                subtitle: Text(
                  'Change Theme',
                  style: TextStyle(
                    color: (themeControllerTrue.isDark).value
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                ),
                trailing: CupertinoSwitch(
                  value: themeControllerTrue.isDark.value,
                  onChanged: (value) {
                    themeControllerTrue.toggleTheme();
                  },
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
