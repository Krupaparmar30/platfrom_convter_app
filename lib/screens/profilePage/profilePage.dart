import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platfrom_convter_app/controller/controller.dart';
import 'package:platfrom_convter_app/controller/platformChange/platformChange.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';
import 'package:platfrom_convter_app/screens/profilePage/commponets/commponets.dart';
import 'package:platfrom_convter_app/utils/all.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

ImagePicker imagePicker = ImagePicker();
File? fileImage;

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlatformConverterController());
    var themeControllerTrue = Get.put(ThemeController());
    var platformController = Get.put(PlatfromChangeController());
    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      controller.selectedTime = "${pickedTime!.hour}:${pickedTime.minute}";
    }

    return Obx(
      () => Scaffold(
        backgroundColor:
            (themeControllerTrue.isDark).value ? Colors.black : Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  controller.fileImagePath.value = "";
                  ImagePicker image = ImagePicker();
                  XFile? xfile =
                      await image.pickImage(source: ImageSource.gallery);
                  if (xfile != null) {
                    String path = xfile!.path;
                    File fileImage = File(path);
                    controller.setImg(fileImage);

                    controller.fileImagePath.value = "image";
                  } else {
                    print("No image selected");
                  }
                },
                child: Obx(
                  () => CircleAvatar(
                    radius: 80,
                    backgroundImage: (controller.fileImagePath.value == "")
                        ? null
                        : FileImage(controller.ImgPath!.value),
                    child: (controller.fileImagePath.value == "")
                        ? Icon(Icons.add_a_photo_outlined, size: 20)
                        : null,
                  ).marginOnly(top: 2, bottom: 4),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: controller.txtName,
                  style: TextStyle(
                    color: (themeControllerTrue.isDark).value
                        ? Colors.white
                        : Colors.black,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: (themeControllerTrue.isDark).value
                            ? Colors.white
                            : Colors.black,
                      ),
                      labelText: "Full Name",
                      labelStyle: TextStyle(
                        color: (themeControllerTrue.isDark).value
                            ? Colors.white
                            : Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: (themeControllerTrue.isDark).value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: (themeControllerTrue.isDark).value
                                ? Colors.white
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.txtPhone,
                  style: TextStyle(
                    // color: Colors.yellow
                    color: (themeControllerTrue.isDark).value
                        ? Colors.white
                        : Colors.black,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: (themeControllerTrue.isDark).value
                            ? Colors.white
                            : Colors.black,
                      ),
                      labelText: "Phone Number",
                      labelStyle: TextStyle(
                        color: (themeControllerTrue.isDark).value
                            ? Colors.white
                            : Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: (themeControllerTrue.isDark).value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: (themeControllerTrue.isDark).value
                                ? Colors.white
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    color: (themeControllerTrue.isDark).value
                        ? Colors.white
                        : Colors.black,
                  ),
                  controller: controller.txtChat,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.chat,
                        color: (themeControllerTrue.isDark).value
                            ? Colors.white
                            : Colors.black,
                      ),
                      labelText: "Chat Conversation",
                      labelStyle: TextStyle(
                        color: (themeControllerTrue.isDark).value
                            ? Colors.white
                            : Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: (themeControllerTrue.isDark).value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: (themeControllerTrue.isDark).value
                                ? Colors.white
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                              selectableDayPredicate: (day) {
                                controller.selectDate = day.year.toString() +
                                    "-" +
                                    day.month.toString() +
                                    "-" +
                                    day.day.toString();
                                return true;
                              },
                            );
                          },
                          icon: Icon(
                            Icons.date_range,
                            color: (themeControllerTrue.isDark).value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Text(
                          '   Pick Date',

                          // (controller.selectDate == null)
                          //     //   ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}
                          //     ? "Pick Date"
                          //     : '  ${controller.selectDate!.day}/${controller.selectDate!.month}/${controller.selectDate!.year}',
                          style: TextStyle(
                            fontSize: 18,
                            color: (themeControllerTrue.isDark).value
                                ? Colors.white
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  )
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
                              Icons.watch_later_outlined,
                              color: (themeControllerTrue.isDark).value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '   Pick Time',
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
              AdeptiveSaveButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

DateTime? selDate;
