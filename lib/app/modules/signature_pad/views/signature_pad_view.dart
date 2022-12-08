import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../controllers/signature_pad_controller.dart';

class SignaturePadView extends GetView<SignaturePadController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignaturePadController>(
        // init: MyController(),
        // initState: (_) {},
        builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('SignaturePadView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showPadTTD();
                },
                child: Text("TTD Pad")),
            // TextButton(
            //   onPressed: () {
            //     controller.handleSaveButtonPressed();
            //     // Navigator.of(context).pop();
            //   },
            //   child: const Text(
            //     'SAVE',
            //     style: TextStyle(
            //         fontWeight: FontWeight.w500, fontFamily: 'Roboto-Medium'),
            //   ),
            // ),
            controller.signatureData != null
                ? Image.memory(
                    controller.signatureData!,
                    height: 200,
                    width: 300,
                  )
                : SizedBox(),
          ],
        ),
      );
    });
  }

  showPadTTD() {
    Get.bottomSheet(
        Container(
          color: Colors.red,
          width: 400,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Silahkan TTD ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Container(
                width: 300,
                height: 200,
                child: SfSignaturePad(
                    minimumStrokeWidth: controller.minWidth,
                    maximumStrokeWidth: controller.maxWidth,
                    strokeColor: controller.strokeColor,
                    backgroundColor: controller.backgroundColor,
                    onDrawStart: controller.handleOnDrawStart,
                    key: controller.signaturePadKey),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Kembali")),
                  SizedBox(
                    width: 32,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.handleSaveButtonPressed();
                      },
                      child: Text("Simpan")),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Colors.blueGrey);
  }
}
