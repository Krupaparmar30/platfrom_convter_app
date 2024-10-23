import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../helper/helper.dart';

class PlatformConverterController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  TextEditingController txtImage = TextEditingController();

  // TextEditingController txtTime = TextEditingController();
  //
  // TextEditingController txtDate = TextEditingController();

  late String selectDate;
  late String selectedTime;
  RxList data = [].obs;
  Rx<File>? ImgPath;
  RxString fileImagePath = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initDb();
  }

  Future<void> initDb() async {
    await PlatformConverterHelper.instance.initDatabase();
    await getRecord();
  }

  void setImg(File img) {
    ImgPath = img.obs;
  }

  Future<void> insertData(String name, double call, String chat, String image,
      String time, String date) async {
    await PlatformConverterHelper.instance
        .insertDataInPlatform(name, call, chat, image, time, date);
    await getRecord();
  }

  Future<void> readLivePlatform(String value) async {
    data.value = await PlatformConverterHelper.instance.readData();
  }

  Future<RxList> getRecord() async {
    data.value = await PlatformConverterHelper.instance.readData();
    return data;
  }

  Future<void> removeRecords(int id) async {
    await PlatformConverterHelper.instance.deleteData(id);
    getRecord();
  }

  Future<void> updateRecords(String name, double call, String chat,
      String image,
      int id) async {
    await PlatformConverterHelper.instance
        .updateData(name, call, chat, image, id);
    getRecord();
  }
}
