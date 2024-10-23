import 'package:get/get.dart';

class SwitchController extends GetxController {
  RxBool isActive = false.obs;

  void isChange(bool value) {
    isActive.value = value;
  }
}
