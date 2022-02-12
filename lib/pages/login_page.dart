import 'package:flutter/material.dart';
import 'package:flutter_app/components/login_custom.dart';
import 'package:flutter_app/components/logo.dart';
import 'package:flutter_app/constants.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: xl_gap),
            Logo("Login"), //"Login"을 Logo에 전달
            SizedBox(height: l_gap),
            LoginCustom(),
          ],
        ),
      ),
    );
  }
}
