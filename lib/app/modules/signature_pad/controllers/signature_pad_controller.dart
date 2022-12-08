import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

/// Local imports
// import '../../../model/sample_view.dart';
import '../../../global_widgets/shared/mobile_image_converter.dart'
    if (dart.library.html) '../shared/web_image_converter.dart';

class SignaturePadController extends GetxController {
  RxBool isSigned = RxBool(false);
  RxInt selectedPenIndex = RxInt(0);

  double minWidth = 1.0;
  double maxWidth = 4.0;
  bool isDark = false;

  List<Color> strokeColors = <Color>[];

  Color? strokeColor = Colors.black;
  Color? backgroundColor = Colors.white;

  Uint8List? signatureData;
  final GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

  Color? getTextColor() => isDark ? Colors.grey[400] : Colors.grey[700];
  Color? getBorderColor() => isDark ? Colors.grey[500] : Colors.grey[350];
  final Color textColor = Colors.black87;

  bool handleOnDrawStart() {
    isSigned.value = true;
    return false;
  }

  Future<void> handleSaveButtonPressed() async {
    late Uint8List data;

    if (kIsWeb) {
      final RenderSignaturePad renderSignaturePad =
          signaturePadKey.currentState!.context.findRenderObject()!
              as RenderSignaturePad;
      data =
          await ImageConverter.toImage(renderSignaturePad: renderSignaturePad);
    } else {
      final ui.Image imageData =
          await signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
      final ByteData? bytes =
          await imageData.toByteData(format: ui.ImageByteFormat.png);
      if (bytes != null) {
        data = bytes.buffer.asUint8List();
      }
    }

    signatureData = data;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
