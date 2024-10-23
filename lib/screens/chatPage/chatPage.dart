import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platfrom_convter_app/controller/controller.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';
import 'package:platfrom_convter_app/screens/profilePage/profilePage.dart';

class chatPage extends StatefulWidget {
  const chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlatformConverterController());
    var themeControllerTrue = Get.put(ThemeController());
    return Scaffold(
        backgroundColor:
            (themeControllerTrue.isDark).value ? Colors.black : Colors.white,
        body: Obx(() => (controller.data.isEmpty)
            ? Center(
                child: Text(
                  'No chats yet...',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    controller.txtName.text = controller.data[index]['name'];
                    controller.txtPhone.text =
                        controller.data[index]['call'].toString();
                    controller.txtChat.text = controller.data[index]['chat'];
                    controller.fileImagePath.value =
                        controller.data[index]['image'];

                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('Actions'),
                          content: Text('Choose an action:'),
                          actions: [
                            CupertinoDialogAction(
                              child: Text('Update'),
                              onPressed: () {
                                Navigator.of(context).pop();
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
                                                controller.fileImagePath.value =
                                                    "image";
                                              }
                                            },
                                            child: Obx(() => CircleAvatar(
                                                  radius: 50,
                                                  backgroundImage: (controller
                                                              .fileImagePath
                                                              .value ==
                                                          "image")
                                                      ? FileImage(controller
                                                          .ImgPath!.value)
                                                      : FileImage(File(
                                                          controller.data[index]
                                                              ['image'])),
                                                )),
                                          ),
                                          _buildTextField(
                                            context,
                                            controller.txtName,
                                            'Full Name',
                                            Icons.person_outline,
                                          ),
                                          _buildTextField(
                                            context,
                                            controller.txtPhone,
                                            'Phone Number',
                                            Icons.call,
                                          ),
                                          _buildTextField(
                                            context,
                                            controller.txtChat,
                                            'Chat Conversation',
                                            Icons.chat_outlined,
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          String name = controller.txtName.text;
                                          double call = double.parse(
                                              controller.txtPhone.text);
                                          String chat = controller.txtChat.text;
                                          int id = controller.data[index]['id'];
                                          String image = controller
                                                      .fileImagePath.value ==
                                                  "image"
                                              ? controller.ImgPath!.value.path
                                              : controller.data[index]['image'];

                                          controller.updateRecords(
                                              name, call, chat, image, id);
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
                                          Get.back(); // Close the dialog
                                        },
                                        child: Text('Cancel'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('Delete'),
                              onPressed: () {
                                controller.removeRecords(
                                    controller.data[index]['id']);
                                Navigator.pop(context);
                              },
                              isDestructiveAction: true,
                            ),
                            CupertinoDialogAction(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              isDefaultAction: true,
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // CircleAvatar(
                            //     radius: 25,
                            //     backgroundImage: FileImage(
                            //         File(controller.data[index]['image']))),
                            // // backgroundImage: FileImage(
                            // //     File(controller.data[index]['image']))
                            // // // (controller.fileImagePath.value == "")
                            // // //     ? null
                            // // //     : FileImage(controller.ImgPath!.value),
                            // // ),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  FileImage(controller.ImgPath!.value),
                            ),
                            //FileImage(File(fileImage!.path))),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${controller.data[index]['name']}\n',
                                      style: TextStyle(
                                        color:
                                            (themeControllerTrue.isDark).value
                                                ? Colors.white
                                                : Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${controller.data[index]['chat']}',
                                      style: TextStyle(
                                        color:
                                            (themeControllerTrue.isDark).value
                                                ? Colors.white
                                                : Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '${controller.data[index]['date']}, ${controller.data[index]['time']}',
                              style: TextStyle(
                                color: (themeControllerTrue.isDark).value
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          ],
                        ).marginSymmetric(horizontal: 15, vertical: 10),
                      ],
                    ),
                  ),
                ),
              )));
  }

  Widget _buildTextField(BuildContext context, TextEditingController controller,
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
        ),
      ),
    ).marginOnly(bottom: 10);
  }
}
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:platfrom_convter_app/controller/controller.dart';
// import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';
//
// import '../cupertino/iosProfile/iosProfile.dart'; // Added for CupertinoDialog
//
// class chatPage extends StatelessWidget {
//   const chatPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     var controller = Get.put(PlatformConverterController());
//     var themeControllerTrue = Get.put(ThemeController());
//
//     return Scaffold(
//       body: (controller.data.isEmpty)
//           ? Center(
//               child: Text(
//                 'No chats yet...',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 18,
//                 ),
//               ),
//             )
//           : ListView.builder(
//               itemCount: controller.data.length,
//               itemBuilder: (context, index) => GestureDetector(
//                 onTap: () {
//                   controller.txtName.text = controller.data[index]['name'];
//                   controller.txtPhone.text =
//                       controller.data[index]['call'].toString();
//                   controller.txtChat.text = controller.data[index]['chat'];
//                   controller.fileImagePath.value =
//                       controller.data[index]['image'];
//
//                   showCupertinoDialog(
//                     context: context,
//                     builder: (context) {
//                       return CupertinoAlertDialog(
//                         title: Text('Actions'),
//                         content: Text('Choose an action:'),
//                         actions: [
//                           CupertinoDialogAction(
//                             child: Text('Update'),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                               showDialog(
//                                 context: context,
//                                 builder: (context) => AlertDialog(
//                                   title: Text('Update Data'),
//                                   content: SingleChildScrollView(
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () async {
//                                             controller.fileImagePath.value = "";
//                                             ImagePicker image = ImagePicker();
//                                             XFile? xfile =
//                                                 await image.pickImage(
//                                                     source:
//                                                         ImageSource.gallery);
//                                             if (xfile != null) {
//                                               String path = xfile.path;
//                                               File fileImage = File(path);
//                                               controller.setImg(fileImage);
//                                               controller.fileImagePath.value =
//                                                   "image";
//                                             }
//                                           },
//                                           child: Obx(
//                                             () => CircleAvatar(
//                                               radius: height * 0.050,
//                                               backgroundImage: (controller
//                                                           .fileImagePath
//                                                           .value ==
//                                                       "image")
//                                                   ? FileImage(
//                                                       controller.ImgPath!.value)
//                                                   : FileImage(File(controller
//                                                       .data[index]['image'])),
//                                             ).marginOnly(
//                                                 top: height * 0.020,
//                                                 bottom: height * 0.030),
//                                           ),
//                                         ),
//                                         _buildTextField(
//                                           context,
//                                           controller.txtName,
//                                           'Full Name',
//                                           Icons.person_outline,
//                                         ),
//                                         _buildTextField(
//                                           context,
//                                           controller.txtPhone,
//                                           'Phone Number',
//                                           Icons.call,
//                                         ),
//                                         _buildTextField(
//                                           context,
//                                           controller.txtChat,
//                                           'Chat Conversation',
//                                           Icons.chat_outlined,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () {
//                                         String name = controller.txtName.text;
//                                         double call = double.parse(
//                                             controller.txtPhone.text);
//                                         String chat = controller.txtChat.text;
//                                         int id = controller.data[index]['id'];
//                                         String image = controller
//                                                     .fileImagePath.value ==
//                                                 "image"
//                                             ? controller.ImgPath!.value.path
//                                             : controller.data[index]['image'];
//
//                                         controller.updateRecords(
//                                             name, call, chat, image, id);
//                                         Get.back();
//                                       },
//                                       child: Text('Save'),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         controller.txtName.clear();
//                                         controller.txtPhone.clear();
//                                         controller.txtChat.clear();
//                                         controller.fileImagePath.value = "";
//                                         Get.back(); // Close the dialog
//                                       },
//                                       child: Text('Cancel'),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                           CupertinoDialogAction(
//                             child: Text('Delete'),
//                             onPressed: () {
//                               controller
//                                   .removeRecords(controller.data[index]['id']);
//                               Navigator.pop(context);
//                             },
//                             isDestructiveAction: true,
//                           ),
//                           CupertinoDialogAction(
//                             child: Text('Cancel'),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             isDefaultAction: true,
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                               radius: 25,
//                               backgroundImage: FileImage(
//                                   File(controller.data[index]['image']))
//                               // (controller.fileImagePath.value == "")
//                               //     ? null
//                               //     : FileImage(controller.ImgPath!.value),
//                               ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: '${controller.data[index]['name']}\n',
//                                     style: TextStyle(
//                                       color: (themeControllerTrue.isDark).value
//                                           ? Colors.white
//                                           : Colors.black,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: '${controller.data[index]['chat']}',
//                                     style: TextStyle(
//                                       color: (themeControllerTrue.isDark).value
//                                           ? Colors.white
//                                           : Colors.black,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               maxLines: 2,
//                               overflow: TextOverflow.fade,
//                             ),
//                           ),
//                           Spacer(),
//                           Text(
//                             '${controller.data[index]['date']}, ${controller.data[index]['time']}',
//                             style: TextStyle(
//                               color: (themeControllerTrue.isDark).value
//                                   ? Colors.white
//                                   : Colors.black,
//                               fontSize: 15,
//                             ),
//                             overflow: TextOverflow.fade,
//                             softWrap: false,
//                           ),
//                         ],
//                       ).marginSymmetric(horizontal: 15, vertical: 10),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }
//
//   Widget _buildTextField(BuildContext context, TextEditingController controller,
//       String labelText, IconData icon) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         prefixIcon: Icon(
//           icon,
//           color: Theme.of(context).colorScheme.secondary,
//         ),
//         labelText: labelText,
//         labelStyle: TextStyle(
//           fontWeight: FontWeight.w500,
//           color: Theme.of(context).colorScheme.secondary,
//         ),
//         focusedBorder: OutlineInputBorder(),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//         ),
//       ),
//     ).marginOnly(bottom: 10);
//   }
// }
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:platfrom_convter_app/controller/controller.dart';
// import 'package:platfrom_convter_app/controller/profile_controller/profile_controller.dart';
//
// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(PlatformConverterController());
//     var profileController = Get.put(ProfileController());
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Obx(
//       () => (controller.data.length == 0)
//           ? Center(
//               child: Text(
//               'No any chats yet...',
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 18,
//                 color: Theme.of(context).colorScheme.secondary,
//               ),
//             ))
//           : ListView.builder(
//               itemCount: controller.data.length,
//               itemBuilder: (context, index) => Card(
//                     child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: FileImage(
//                             File(controller.data[index]['image']),
//                           ),
//                         ),
//                         title: Text(controller.data[index]['name']),
//                         subtitle: Text(controller.data[index]['chat']),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '${controller.data[index]['date'] + ' \n ${controller.data[index]['time']}'}',
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//
//                             // GestureDetector(
//                             //     onTap: () {
//                             //       homeController.removeData(
//                             //         int.parse(
//                             //           homeController.data[index]['id']
//                             //               .toString(),
//                             //         ),
//                             //       );
//                             //     },
//                             //     child: const Icon(
//                             //       Icons.delete,
//                             //       color: Colors.red,
//                             //     ))
//
//                             GestureDetector(
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (context) => AlertDialog(
//                                       title: const Text('Update----- '),
//                                       content: SingleChildScrollView(
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             GestureDetector(
//                                               onTap: () async {
//                                                 controller.fileImagePath.value =
//                                                     "";
//                                                 ImagePicker image =
//                                                     ImagePicker();
//                                                 XFile? xfile =
//                                                     await image.pickImage(
//                                                         source: ImageSource
//                                                             .gallery);
//
//                                                 if (xfile != null) {
//                                                   // Check if xfile is not null
//                                                   String path = xfile.path;
//                                                   File fileImage = File(path);
//                                                   controller.setImg(fileImage);
//                                                   controller.fileImagePath
//                                                       .value = "img";
//                                                 } else {
//                                                   // Handle the case where the user did not pick an image
//                                                   print("No image selected");
//                                                 }
//                                               },
//                                               child: Obx(
//                                                 () => CircleAvatar(
//                                                   radius: height * 0.060,
//                                                   backgroundColor:
//                                                       Theme.of(context)
//                                                           .focusColor,
//                                                   backgroundImage: (controller
//                                                               .fileImagePath
//                                                               .value ==
//                                                           "")
//                                                       ? null
//                                                       : FileImage(controller
//                                                           .ImgPath!.value),
//                                                   child: (controller
//                                                               .fileImagePath
//                                                               .value ==
//                                                           "")
//                                                       ? Icon(
//                                                           Icons
//                                                               .add_a_photo_outlined,
//                                                           size: height * 0.035,
//                                                           color: Theme.of(
//                                                                   context)
//                                                               .colorScheme
//                                                               .onPrimaryContainer,
//                                                         )
//                                                       : null,
//                                                   // child: controller.ImgPath!.value == null
//                                                   //     ? Icon(Icons.person, size: 100)
//                                                   //     : null,
//                                                 ).marginOnly(
//                                                     top: height * 0.020,
//                                                     bottom: height * 0.030),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             TextFormField(
//                                               controller: controller.txtName,
//                                               decoration: InputDecoration(
//                                                   enabledBorder:
//                                                       OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10)),
//                                                   focusedBorder:
//                                                       OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10)),
//                                                   hintText: 'Name....',
//                                                   hintStyle: TextStyle(
//                                                       color: Colors.grey)),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             TextFormField(
//                                               controller: controller.txtChat,
//                                               decoration: InputDecoration(
//                                                   enabledBorder:
//                                                       OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10)),
//                                                   focusedBorder:
//                                                       OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10)),
//                                                   hintText: 'Chat....',
//                                                   hintStyle: TextStyle(
//                                                       color: Colors.grey)),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             TextFormField(
//                                               controller: controller.txtPhone,
//                                               decoration: InputDecoration(
//                                                   enabledBorder:
//                                                       OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10)),
//                                                   focusedBorder:
//                                                       OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10)),
//                                                   hintText: 'Phone....',
//                                                   hintStyle: TextStyle(
//                                                       color: Colors.grey)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       actions: [
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             controller.updateRecords(
//                                               controller.txtName.text,
//                                               controller.txtChat.text as double,
//                                               controller.txtPhone.text,
//                                               controller.ImgPath!.value.path,
//                                               controller.data[index]['id'],
//                                             );
//
//                                             controller.txtName.clear();
//                                             controller.txtChat.clear();
//                                             controller.txtPhone.clear();
//                                             controller.selectedTime = "";
//                                             controller.selectDate = "";
//                                             Get.back();
//                                           },
//                                           child: Text(
//                                             'save',
//                                             style:
//                                                 TextStyle(color: Colors.green),
//                                           ),
//                                         ),
//                                         ElevatedButton(
//                                             onPressed: () {
//                                               controller.txtName.clear();
//                                               controller.txtPhone.clear();
//                                               controller.txtChat.clear();
//                                               controller.fileImagePath.value =
//                                                   "";
//                                               controller.selectedTime = "";
//                                               controller.selectDate = "";
//                                               Get.back();
//                                             },
//                                             child: Text(
//                                               'cancel',
//                                               style:
//                                                   TextStyle(color: Colors.red),
//                                             ))
//                                       ],
//                                     ),
//                                   );
//                                 },
//                                 child: Icon(Icons.edit))
//                           ],
//                         )),
//                   )),
//     );
//   }
// }
