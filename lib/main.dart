import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:test_getx/loadData.dart';
import 'package:test_getx/passenger.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoadData(),
        ),
      ],
      child: GetMaterialApp(
        home: Passenger(),
        theme: new ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.light,
        ),
        /*darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),*/
        //themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
