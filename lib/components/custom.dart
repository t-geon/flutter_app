import 'package:flutter/material.dart';
import 'package:flutter_app/components/text_form.dart';
import 'package:flutter_app/size.dart';

class Custom extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextForm("Email"), //text_form에 작성된 class에 Email 전달
          SizedBox(height: m_gap),
          TextForm("Password"), //text_form에 작성된 class에 Password 전달
          SizedBox(height: l_gap),
          TextButton(
            onPressed: () {
              //값이 있는지 확인, 값이 있으면 if문으로 들어간다
              if (_formKey.currentState!.validate()) {
                //Navigator.pushNamed(context, "/home"); //로그인 버튼 누르면 홈으로 이동
                Navigator.pushNamed(context, "/list");
              }
            },
            child: Text("Login"), //버튼에 Login쓰기
          ),
        ],
      ),
    );
  }
}
