import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePage extends StatelessWidget {
  RxBool _isLightTheme = false.obs;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', _isLightTheme.value);
  }

  _getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    _isLightTheme.value = await _isLight.value;
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  DarkThemePage() {
    _getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Mode Demo'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                    () => Text(
                  'Click on switch to change to ${_isLightTheme.value ? 'Dark' : 'Light'} theme',
                ),
              ),
              ObxValue(
                    (data) => Switch(
                  value: _isLightTheme.value,
                  onChanged: (val) {
                    _isLightTheme.value = val;
                    Get.changeThemeMode(
                      _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                    );
                    _saveThemeStatus();
                  },
                ),
                false.obs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}