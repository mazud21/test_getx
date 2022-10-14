import 'package:get/get.dart';

import '../controller/data_controller.dart';

class DataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DataController());
  }

}

class DataBinding2 extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DataController());
  }

}