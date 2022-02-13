import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static String routeName = "/sign";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1b50b6),
        automaticallyImplyLeading: false,
        title: Text("회원가입"),
      ),
      body: Center(child: Text("sign up page")),
    );
  }
}
