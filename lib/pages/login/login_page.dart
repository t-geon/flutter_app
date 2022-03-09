import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/default_button.dart';
import 'package:flutter_app/components/login_custom.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'find_id.dart';
import 'find_password.dart';
import '../splash_page.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;
  final _formKey = GlobalKey<FormState>();
  final _authentication = FirebaseAuth.instance;

  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if(isValid){
      _formKey.currentState!.save();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // GestureDetector widget 이용해서 unfocus 기능 구현
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
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
                TextFormField(
                  key: ValueKey(1),
                  validator: (value) {
                    if(value!.isEmpty || !value.contains('@')){
                      return 'Please enter a valid email address.';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "아이디를 입력하세요.",
                    labelText: "ID",
                    labelStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    // TextField테두리 설정
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false, // 입력하는 동안 보이도록 설정
                  maxLength: 30, // 20글자로 제한
                  onSaved: (value){
                    userEmail = value!;
                  },
                  onChanged: (value){
                    userEmail = value;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  key: ValueKey(2),
                  validator: (value){
                    if(value!.isEmpty || value.length < 7){
                      return 'Password must be at least 7 characters long.';
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "비밀번호를 입력하세요.",
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      // TextField테두리 설정
                      border: OutlineInputBorder(),
                      // icon button 이용해 obscureText 속성 값을 변경해준다.
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
                  onSaved: (value){
                    userPassword = value!;
                  },
                  onChanged: (value){
                    userPassword = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                // 로그인 버튼
                DefaultButton(
                    text: '로그인',
                    press: () async {
                      _tryValidation();
                      try{
                        final newUser = await _authentication.signInWithEmailAndPassword(
                          email: userEmail, password: userPassword,
                        );
                        if(newUser.user != null){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            }
                          ));
                        }
                      }catch(e){
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please check your email and password'),
                            backgroundColor: Colors.blue,
                          )
                        );
                      }

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
      ),
    );
  }
}
