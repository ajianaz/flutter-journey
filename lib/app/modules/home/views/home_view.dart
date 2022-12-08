import 'package:flutter/material.dart';
import 'package:flutter_journey/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.SIGNATURE_PAD);
              },
              child: Text("TTD"))
        ],
      )),
    );
  }
}
