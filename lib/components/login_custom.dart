import 'package:flutter/material.dart';
import 'package:flutter_app/components/default_button.dart';
import 'package:flutter_app/components/text_form.dart';
import 'package:flutter_app/constants.dart';

//로그인 양식 작성된 곳
class LoginCustom extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextForm("아이디"), //text_form에 작성된 class에 Email 전달
          SizedBox(height: m_gap),
          TextForm("비밀번호"), //text_form에 작성된 class에 Password 전달
          SizedBox(height: l_gap),
          DefaultButton(
            //default_button.dart에 정의한 함수 이용해 로그인 버튼 생성
            text: "로그인",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/main"); //로그인 버튼 누르면 홈으로 이동
              }
            },
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          DefaultButton(
            //default_button.dart에 정의한 함수 이용해 회원가입 버튼 생성
            text: "회원가입",
            press: () {
              Navigator.pushNamed(context, "/sign"); //회원가입 버튼 누르면 회원가입으로 이동
            },
          ),
        ],
      ),
    );
  }
}
