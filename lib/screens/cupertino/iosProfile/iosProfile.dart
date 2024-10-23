import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platfrom_convter_app/controller/controller.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';
import 'package:platfrom_convter_app/screens/cupertino/iosProfile/commponets/commponets_save.dart';
import 'package:platfrom_convter_app/screens/cupertino/iosProfile/commponets/componets_ios.dart';
import 'package:platfrom_convter_app/screens/profilePage/commponets/commponets.dart';
import 'package:platfrom_convter_app/utils/all.dart';

ImagePicker imagePicker = ImagePicker();
File? fileImage;

class IosProfile extends StatelessWidget {
  const IosProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlatformConverterController());
    var themeControllerTrue = Get.put(ThemeController());
    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        controller.selectedTime = "${pickedTime.hour}:${pickedTime.minute}";
      }
    }

    return SingleChildScrollView(
      child: CupertinoPageScaffold(
          backgroundColor: (themeControllerTrue.isDark).value
              ? CupertinoColors.black
              : CupertinoColors.white,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () async {
                  controller.fileImagePath.value = "";
                  ImagePicker image = ImagePicker();
                  XFile? xfile =
                      await image.pickImage(source: ImageSource.gallery);
                  if (xfile != null) {
                    File fileImage = File(xfile.path);
                    controller.setImg(fileImage);
                    controller.fileImagePath.value = "image";
                  }
                },
                child: Obx(() => ClipOval(
                      child: Container(
                        height: 150,
                        width: 150,
                        color: (themeControllerTrue.isDark).value
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                        alignment: Alignment.center,
                        child: (controller.fileImagePath.value == "")
                            ? Icon(
                                CupertinoIcons.camera,
                                color: (themeControllerTrue.isDark).value
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                                size: 35,
                              )
                            : Image(
                                image: FileImage(controller.ImgPath!.value),
                                fit: BoxFit.cover,
                                width: 100,
                              ),
                      ),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              iosTextFilds(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                              selectableDayPredicate: (day) {
                                controller.selectDate =
                                    "${day.year}-${day.month}-${day.day}";
                                return true;
                              },
                            );
                          },
                          child: Icon(
                            CupertinoIcons.calendar,
                            color: (themeControllerTrue.isDark).value
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Add spacing between icon and text
                        Text(
                          'Pick Date',
                          style: TextStyle(
                            color: (themeControllerTrue.isDark).value
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _selectTime(context);
                            },
                            child: Icon(
                              CupertinoIcons.time,
                              color: (themeControllerTrue.isDark).value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Pick Time',
                            style: TextStyle(
                                color: (themeControllerTrue.isDark).value
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18),
                          ),
                        ],
                      ).marginOnly(left: 15, top: 15, bottom: 15)),
                ],
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: Row(
                    children: [componetsSave()],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

DateTime? selDate;
DateTime? timeS;
