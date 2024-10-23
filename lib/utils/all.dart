import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platfrom_convter_app/controller/controller.dart';
import 'package:platfrom_convter_app/controller/switchController/switchController.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';

class AdeptiveSaveButtons extends StatelessWidget {
  const AdeptiveSaveButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlatformConverterController());
    var themeControllerTrue = Get.put(ThemeController());
    return GestureDetector(
      onTap: () {
        String name = controller.txtName.text ?? "";
        double call = double.parse(controller.txtPhone.text);
        String chat = controller.txtChat.text ?? "";
        String image = controller.txtImage.text;
        String time = controller.selectedTime;
        String date = controller.selectDate;

        controller.insertData(name, call, chat, image, time, date);
        controller.txtChat.clear();
        controller.txtPhone.clear();
        controller.txtName.clear();
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          "SAVE",
          style: TextStyle(
            color: (themeControllerTrue.isDark).value
                ? Colors.black
                : Colors.white,
          ),
        )),
      ),
    );
  }
}
