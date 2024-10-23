import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  ImagePicker imagePicker = ImagePicker();
  Rx<File?> profileImage = Rx<File?>(null);
  RxBool isProfile = false.obs;
  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtBio = TextEditingController();

  ImagePicker get picker => imagePicker;

  void profileImageGet() async {
    XFile? images = await picker.pickImage(source: ImageSource.camera);
    if (images != null) {
      profileImage.value = File(images.path);
    }
  }

  void clearprofile() {
    profileImage.value = null;
    txtFullName.clear();
    txtBio.clear();
  }

  void profileshow(bool value) {
    isProfile = value.obs;
  }
}
