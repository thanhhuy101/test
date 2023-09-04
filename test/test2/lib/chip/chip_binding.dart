import 'package:get/get.dart';
import 'package:test2/chip/chip_controller.dart';

class ChipBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChipController>(() => ChipController());
  }
}
