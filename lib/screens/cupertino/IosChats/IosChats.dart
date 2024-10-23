import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platfrom_convter_app/controller/controller.dart';
import 'package:platfrom_convter_app/controller/switchController/switchController.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';

import '../iosProfile/iosProfile.dart';

class IosChats extends StatelessWidget {
  const IosChats({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlatformConverterController());
    var themeControllerTrue = Get.put(ThemeController());
    var switchTrue = Get.put(SwitchController());
    return CupertinoPageScaffold(
      backgroundColor: (themeControllerTrue.isDark).value
          ? CupertinoColors.black
          : CupertinoColors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              controller.data.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text("Actions"),
                        actions: [
                          CupertinoDialogAction(
                              onPressed: () {
                                Get.back();
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Update Data'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              controller.fileImagePath.value =
                                                  "";
                                              ImagePicker image = ImagePicker();
                                              XFile? xfile =
                                                  await image.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (xfile != null) {
                                                String path = xfile.path;
                                                File fileImage = File(path);
                                                controller.setImg(fileImage);
                                                if (controller.ImgPath !=
                                                    null) {
                                                  controller.fileImagePath
                                                      .value = "image";
                                                }
                                              }
                                            },
                                            child: Obx(() => CircleAvatar(
                                                  radius: 80,
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .onSecondary,
                                                  backgroundImage: (controller
                                                              .fileImagePath
                                                              .value ==
                                                          "image")
                                                      ? FileImage(controller
                                                          .ImgPath!.value)
                                                      : FileImage(controller
                                                          .ImgPath!.value),
                                                )),
                                          ),
                                          BuildTextField(
                                              context,
                                              controller.txtName,
                                              'Full Name',
                                              Icons.person_outline),
                                          BuildTextField(
                                              context,
                                              controller.txtPhone,
                                              'Phone Number',
                                              Icons.call),
                                          BuildTextField(
                                              context,
                                              controller.txtChat,
                                              'Chat Conversation',
                                              Icons.chat_outlined),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          // Update logic
                                          String name = controller.txtName.text;
                                          double call = double.parse(
                                              controller.txtPhone.text);
                                          String chat = controller.txtChat.text;
                                          String img = controller
                                                      .fileImagePath.value ==
                                                  "image"
                                              ? controller.ImgPath!.value.path
                                              : controller.data[index]['image'];
                                          int id = controller.data[index]['id'];

                                          // Call the updateData method
                                          controller.updateRecords(
                                              name, call, chat, img, id);
                                          Get.back();
                                        },
                                        child: Text('Save'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.txtName.clear();
                                          controller.txtPhone.clear();
                                          controller.txtChat.clear();
                                          controller.fileImagePath.value = "";
                                          Get.back();
                                        },
                                        child: Text('Cancel'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text("Upadate"))
                        ],
                      ),
                    );
                  },
                  child: CupertinoButton(
                      onPressed: () {},
                      child: CupertinoListTile(
                        leading: CircleAvatar(
                          radius: 80,
                          backgroundColor: (themeControllerTrue.isDark).value
                              ? CupertinoColors.white
                              : CupertinoColors.black,
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
                        // trailing: Text(
                        //   '${controller.data[index]['date']}, ${controller.data[index]['time']}',
                        //   style: TextStyle(
                        //     fontSize: 15,
                        //   ),
                        // ),
                        trailing: Text(
                          '${controller.data[index]['date']}, ${controller.data[index]['time']}',
                          style: TextStyle(
                            color: (themeControllerTrue.isDark).value
                                ? Colors.black
                                : Colors.white,
                            fontSize: 15,
                          ),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget BuildTextField(BuildContext context, TextEditingController controller,
    String labelText, IconData icon) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      labelText: labelText,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.secondary,
      ),
      focusedBorder: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
          width: 2,
        ),
      ),
    ),
  ).marginOnly(bottom: 10);
}
