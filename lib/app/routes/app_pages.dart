import 'package:get/get.dart';

import 'package:flutter_journey/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_journey/app/modules/home/views/home_view.dart';
import 'package:flutter_journey/app/modules/signature_pad/bindings/signature_pad_binding.dart';
import 'package:flutter_journey/app/modules/signature_pad/views/signature_pad_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNATURE_PAD,
      page: () => SignaturePadView(),
      binding: SignaturePadBinding(),
    ),
  ];
}
