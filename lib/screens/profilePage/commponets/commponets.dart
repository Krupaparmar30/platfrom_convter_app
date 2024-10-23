import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platfrom_convter_app/controller/controller.dart';
import 'package:platfrom_convter_app/controller/switchController/switchController.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';

class ProfileTextFiled extends StatelessWidget {
  const ProfileTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlatformConverterController());
    var themeControllerTrue = Get.put(ThemeController());

    return Column(
      children: [],
    );
  }

// List<Widget> box2(PlatformConverterController controller,
//     ThemeController themeControllerTrue, BuildContext context) {
//   return [
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: CupertinoTextField(
//           controller: controller.txtName,
//           placeholder: "Full Name",
//           placeholderStyle: TextStyle(
//             color: (themeControllerTrue.isDark).value
//                 ? CupertinoColors.white
//                 : CupertinoColors.black,
//           ),
//           prefix: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.person,
//               color: (themeControllerTrue.isDark).value
//                   ? CupertinoColors.white
//                   : CupertinoColors.black,
//             ),
//           ),
//           style: TextStyle(
//             color: (themeControllerTrue.isDark).value
//                 ? CupertinoColors.white
//                 : CupertinoColors.black,
//           ),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: (themeControllerTrue.isDark).value
//                     ? CupertinoColors.white
//                     : CupertinoColors.black,
//               ))),
//     ),
//     SizedBox(
//       height: 10,
//     ),
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: CupertinoTextField(
//           controller: controller.txtPhone,
//           placeholder: "Phone Number",
//           placeholderStyle: TextStyle(
//             color: (themeControllerTrue.isDark).value
//                 ? CupertinoColors.white
//                 : CupertinoColors.black,
//           ),
//           prefix: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.call,
//               color: (themeControllerTrue.isDark).value
//                   ? CupertinoColors.white
//                   : CupertinoColors.black,
//             ),
//           ),
//           style: TextStyle(
//             color: (themeControllerTrue.isDark).value
//                 ? CupertinoColors.white
//                 : CupertinoColors.black,
//           ),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: (themeControllerTrue.isDark).value
//                     ? CupertinoColors.white
//                     : CupertinoColors.black,
//               ))),
//     ),
//     SizedBox(
//       height: 10,
//     ),
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: CupertinoTextField(
//           controller: controller.txtChat,
//           placeholder: "Chat Conversation",
//           placeholderStyle: TextStyle(
//             color: (themeControllerTrue.isDark).value
//                 ? CupertinoColors.white
//                 : CupertinoColors.black,
//           ),
//           prefix: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.chat,
//               color: (themeControllerTrue.isDark).value
//                   ? CupertinoColors.white
//                   : CupertinoColors.black,
//             ),
//           ),
//           style: TextStyle(
//             color: (themeControllerTrue.isDark).value
//                 ? CupertinoColors.white
//                 : CupertinoColors.black,
//           ),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: (themeControllerTrue.isDark).value
//                     ? CupertinoColors.white
//                     : CupertinoColors.black,
//               ))),
//     ),
//   ];
// }
}
