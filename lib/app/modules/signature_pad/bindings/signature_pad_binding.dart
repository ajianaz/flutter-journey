import 'package:get/get.dart';

import '../controllers/signature_pad_controller.dart';

class SignaturePadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignaturePadController>(
      () => SignaturePadController(),
    );
  }
}
