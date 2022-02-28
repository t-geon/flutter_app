import 'package:flutter/material.dart';
import 'package:flutter_app/components/default_button.dart';
import 'package:flutter_app/components/login_custom.dart';
import 'package:flutter_app/constants.dart';
import 'find_id.dart';
import 'find_password.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;
  TextEditingController _idController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String? _passwordError;
  String? _idError;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // GestureDetector widget 이용해서 unfocus 기능 구현
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(height: xl_gap),
              Text(
                'WBC Detector \n 로그인',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              //Logo("Login"), //"Login"을 Logo에 전달
              SizedBox(height: l_gap),
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                  hintText: "아이디를 입력하세요.",
                  labelText: "ID",
                  errorText: _idError,
                  labelStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  // TextField테두리 설정
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: false, // 입력하는 동안 보이도록 설정
                maxLength: 20, // 20글자로 제한
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: "비밀번호를 입력하세요.",
                    labelText: "Password",
                    errorText: _passwordError, // error를 표현하기 위해서 사용하는 속성
                    labelStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    // TextField테두리 설정
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _secureText ? Icons.remove_red_eye : Icons.security),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                    )),
                obscureText: _secureText,
              ),
              SizedBox(
                height: 20.0,
              ),
              /* 테스트로 만들어본 TextFormField 이용한 버튼
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return null;
                    }
                    if (value.length < 3) {
                      return "Enter at least 3 words";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "아이디를 입력하세요.",
                    labelText: "ID",
                    errorText: null, // error를 표현하기 위해서 사용하는 속성
                    labelStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  // TextField테두리 설정
                  border: OutlineInputBorder(),
                )),
              ),
              */
              // 로그인 버튼
              DefaultButton(
                  text: '로그인',
                  press: () {
                    print('Name ' + _idController.text);
                    print('Password ' + _passwordController.text);
                    setState(() {
                      if (_passwordController.text.length < 3 &&
                          _idController.text.length < 3) {
                        //아이디 비밀번호 모두 미입력
                        _passwordError = "Enter at least 3 words";
                        _idError = "Enter at least 3 words";
                      } else if (_idController.text.length < 3) {
                        //아이디 미입력
                        _idError = "Enter at least 3 words";
                        _passwordError = "";
                      } else if (_passwordController.text.length < 3) {
                        //비밀번호 미입력
                        _passwordError = "Enter at least 3 words";
                        _idError = "";
                      } else {
                        // 일단 3개 넘어가면 다음 화면으로 넘어갈수 있도록 구현함
                        _passwordError = null;
                        Navigator.pushNamed(context, "/main");
                      }
                    });
                  }),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              // 회원가입 버튼
              DefaultButton(
                //default_button.dart에 정의한 함수 이용해 회원가입 버튼 생성
                text: "회원 가입",
                press: () {
                  Navigator.pushNamed(context, "/sign"); //회원가입 버튼 누르면 회원가입으로 이동
                },
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextButton(
                child: Text(
                  "아이디를 잊으셨나요?",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  // 아이디 찾는 페이지로 이동
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FindID()));

                },
              ),
              TextButton(
                child: Text(
                  "비밀번호를 잊으셨나요?",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  // 비밀번호 찾는 페이지로 이동
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FindPassword()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
