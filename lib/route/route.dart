
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_getx/view/darktheme.dart';
import 'package:test_getx/view/login.dart';
import 'package:test_getx/view/user.dart';

import '../bindings/data_binding.dart';

class Routes{

  static final routes = [

    GetPage(
      name: '/user',
      page: () => User(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => Login(),
    ),
    GetPage(
      name: '/darkThemePage',
      page: () => DarkThemePage(),
    ),
  ];
}