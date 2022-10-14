import 'package:flutter/material.dart';
import 'package:test_getx/route/route.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: '/login',
        getPages: Routes.routes
    );
  }
}
