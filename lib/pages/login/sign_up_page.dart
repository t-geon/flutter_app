import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/components/default_button.dart';
import 'package:flutter_app/components/text_form.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/pages/login/login_page.dart';
import 'package:flutter_app/share/authentication.dart';
import 'loading.dart';

//회원가입 페이지
class SignUpPage extends StatefulWidget {
  static String routeName = "/sign";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _idFormKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final _auth = Authentication();

  bool _isLogin = true;
  late String _userId = "";
  late String _password = "";
  late String _id = "";
  String _message = ""; // 오류 메시지 보관
  String _userName = "";
  String _phoneNumber = "";

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  Widget idInput() {
    return Padding(
        padding: EdgeInsets.only(top: 50),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "아이디",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              //터치시 TextFormField 디자인
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              //에러 발생시 TextFormField 디자인
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              //에러 발생 후 터치 시 TextFormField 디자인
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          validator: (value) => value!.isEmpty ? "아이디를 입력해주세요." : null,
          onSaved: (value) {
            _userId = value!;
          },
          onChanged: (value) {
            _userId = value;
          },
        ));
  }

  Widget passwordInput() {
    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "비밀번호",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              //터치시 TextFormField 디자인
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              //에러 발생시 TextFormField 디자인
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              //에러 발생 후 터치 시 TextFormField 디자인
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          validator: (value) => value!.isEmpty ? "비밀번호를 입력해주세요." : null,
          onSaved: (value) {
            _password = value!;
          },
          onChanged: (value) {
            _password = value;
          },
        ));
  }

  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: PrimaryColor,
            padding: EdgeInsets.all(16),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _userId = (await _auth.login(_userId, _password))!;
              print('Login for user $_userId');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoadingPage()));
            }
          },
          child: Center(
            child: Text(
              '로그인',
              style: textTheme().subtitle1,
            ),
          ),
        ),
      ),
    );
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("아이디"),
            Form(
              key: _idFormKey,
              child: TextFormField(
                key: ValueKey(1),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address.';
                  }
                },
                decoration: InputDecoration(
                  hintText: "아이디를 입력하세요",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onSaved: (value) {
                  _userId = value!;
                },
                onChanged: (value) {
                  _userId = value;
                },
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            //중복확인 버튼
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PrimaryColor,
                padding: EdgeInsets.all(10),
              ),
              onPressed: () {
                if (_idFormKey.currentState!.validate()) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          content: Text('사용가능한 아이디입니다.'),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('확인'),
                            )
                          ],
                        );
                      });
                }
              },
              child: Center(
                child: Text('중복확인'),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("비밀번호"),
                  TextFormField(
                    key: ValueKey(1),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Please enter a valid password.';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "비밀번호를 입력하세요",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    onSaved: (value) {
                      _password = value!;
                    },
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                  SizedBox(height: l_gap),
                  Text("비밀번호 확인"),
                  TextFormField(
                    key: ValueKey(2),
                    decoration: InputDecoration(
                      hintText: "비밀번호를 입력하세요",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value != _password) {
                        return 'Password is not same.';
                      }
                    },
                  ),
                  SizedBox(height: l_gap),

                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Text('- 개인정보 입력'),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Text("이름"), //text_form에 작성된 class에 사용자 이름 전달
                  TextFormField(
                    key: ValueKey(3),
                    decoration: InputDecoration(
                      hintText: "이름을 입력해주세요.",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length > 9) {
                        return 'Please enter a valid name.';
                      }
                    },
                  ),
                  SizedBox(height: l_gap),
                  Text("핸드폰 번호 (-제외)"), //text_form에 작성된 class에 사용자 전화번호 전달
                  TextFormField(
                    key: ValueKey(4),
                    decoration: InputDecoration(
                      hintText: "핸드폰 번호 (-제외)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length != 11) {
                        return 'Please enter a valid phone number.';
                      }
                    },
                  ),
                  SizedBox(height: l_gap),

                  DefaultButton(
                    //default_button.dart에 정의한 함수 이용해 찾기 버튼 생성
                    text: "회원가입",
                    press: () {
                      _tryValidation();
                      //성공시 로그인 화면, 실패시(중복확인, 입력안한거) 알리기
                      //Navigator.pushNamed(context, "/login");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          // 조금 더 수정해야 할 듯. (팝업창이 뜨도록)
                          content: Text("사용가능한 아이디입니다."),
                          duration: Duration(seconds: 3),
                        ),                       
                      );
                      Navigator.pop(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  DefaultButton(
                    //default_button.dart에 정의한 함수 이용해 취소 버튼 생성
                    text: "취소",
                    press: () {
                      Navigator.pop(
                          context); // 취소 버튼을 누르면 stack에서 해당 페이지를 제외한다.
                      //Navigator.pushNamed(context, "/login"); //취소 버튼 누르면 계정 정보화면 이동
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
