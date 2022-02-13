import 'package:flutter/material.dart';

//회원가입 페이지
class SignUpPage extends StatelessWidget {
  static String routeName = "/sign";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("회원가입"),
        //뒤로 가기 버튼
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Center(child: Text("sign up page")),
    );
  }
}
