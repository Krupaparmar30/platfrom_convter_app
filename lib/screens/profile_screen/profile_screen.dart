import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platfrom_convter_app/controller/profile_controller/profile_controller.dart';
import 'package:platfrom_convter_app/controller/theme_controller/theme_controller.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    var proController = Get.put(ProfileController());
    var themeControllerTrue = Get.put(ThemeController());

    return Obx(
      () => Scaffold(
          backgroundColor:
              (themeControllerTrue.isDark).value ? Colors.black : Colors.white,
          body: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.person_outline,
                  color: (themeControllerTrue.isDark).value
                      ? Colors.white
                      : Colors.black,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color: (themeControllerTrue.isDark).value
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                subtitle: const Text('Update Profile Data'),
                trailing: Obx(
                  () => Switch(
                    value: proController.isProfile.value,
                    onChanged: (value) {
                      proController.profileshow(value);
                    },
                  ),
                ),
              ),
              if (proController.isProfile.value)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(onTap: () {
                        proController.profileImageGet();
                      }, child: Obx(() {
                        return CircleAvatar(
                            radius: 60,
                            backgroundImage: proController.profileImage.value !=
                                    null
                                ? FileImage(proController.profileImage.value!)
                                : NetworkImage(
                                    "https://static.vecteezy.com/system/resources/thumbnails/009/273/280/small/concept-of-loneliness-and-disappointment-in-love-sad-man-sitting-element-of-the-picture-is-decorated-by-nasa-free-photo.jpg"));
                      })),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: TextField(
                          controller: proController.txtFullName,
                          decoration: InputDecoration.collapsed(
                            hintStyle: TextStyle(
                              color: (themeControllerTrue.isDark).value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            hintText: 'Enter your Name...',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: TextFormField(
                            controller: proController.txtBio,
                            decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                color: (themeControllerTrue.isDark).value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              hintText: 'Enter your Bio..',
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: (themeControllerTrue.isDark).value
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                proController.clearprofile();
                              },
                              child: Text(
                                'Clear',
                                style: TextStyle(
                                  color: (themeControllerTrue.isDark).value
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              )),
                        ],
                      )
                    ])
              // : Container(),
              ,
              ListTile(
                leading: Icon(
                  Icons.light_mode_outlined,
                  color: (themeControllerTrue.isDark).value
                      ? Colors.white
                      : Colors.black,
                ),
                title: Text(
                  'Theme',
                  style: TextStyle(
                    color: (themeControllerTrue.isDark).value
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Change Theme',
                  style: TextStyle(
                    color: (themeControllerTrue.isDark).value
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                trailing: Switch(
                  // inactiveThumbColor: Colors.white,
                  value: themeControllerTrue.isDark.value,
                  onChanged: (value) {
                    themeControllerTrue.toggleTheme();
                  },
                ),
              )
            ],
          )),
    );
  }
}
// Container(
// height: 100,
// width: 400,
// color: (themeControllerTrue.isDark).value
// ? Theme.of(context).colorScheme.secondary
//     : Theme.of(context).colorScheme.primary,
// child: ListTile(
// leading: Icon(
// Icons.account_circle,
// color: (themeControllerTrue.isDark).value
// ? Theme.of(context).colorScheme.primary
//     : Theme.of(context).colorScheme.secondary,
// size: 30,
// ),
// title: Text(
// "Profile",
// style: TextStyle(
// color: (themeControllerTrue.isDark).value
// ? Theme.of(context).colorScheme.primary
//     : Theme.of(context).colorScheme.secondary,
// ),
// ),
// subtitle: Text(
// "Update Profile Data",
// style: TextStyle(
// color: (themeControllerTrue.isDark).value
// ? Theme.of(context).colorScheme.primary
//     : Theme.of(context).colorScheme.secondary,
// ),
// ),
// trailing: profileScreen(),
// ),
// ),
