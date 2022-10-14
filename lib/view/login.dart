import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/bindings/data_binding.dart';
import 'package:test_getx/controller/data_controller.dart';
import 'package:test_getx/view/user.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final pwdController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(hintText: ' name...'),
          ),
          TextFormField(
            controller: pwdController,
            decoration: InputDecoration(hintText: ' password...'),
            obscureText: true,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(hintText: ' email...'),
          ),
          TextButton(onPressed: () {
            Get.to(
                User(),
                transition: Transition.downToUp,
              duration: Duration(milliseconds: 500),
              binding: DataBinding(),
              opaque: true
            );
            setState(() {
              GetUtils.isLengthGreaterThan(nameController.text, 6) ? print('Name is valid') : print('Name is invalid!!!');
              GetUtils.isMD5('3bc8471bb664e23c0ce91ea1872fcb85') ? print('Access Granted') : print('Access Denied');
              GetUtils.isEmail(emailController.text) ? print('Email is valid') : print('Email is invalid!!!');
            });
          },
              child: Text("Validate"))
        ],
      ),
    );
  }
}