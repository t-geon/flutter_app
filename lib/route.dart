import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/list_page.dart';
import 'package:flutter_app/pages/login/find_id.dart';
import 'package:flutter_app/pages/login/find_password.dart';
import 'package:flutter_app/pages/login/login_page.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/pages/result_page.dart';
import 'package:flutter_app/pages/setting/id_page.dart';
import 'package:flutter_app/pages/setting/notice_page.dart';
import 'package:flutter_app/pages/setting/password_change_page.dart';
import 'package:flutter_app/pages/setting/version_page.dart';
import 'package:flutter_app/pages/setting_page.dart';
import 'package:flutter_app/pages/login/sign_up_page.dart';
import 'package:flutter_app/pages/splash_page.dart';

final Map<String, WidgetBuilder> route = {
  SplashPage.routeName: (context) => SplashPage(),
  LoginPage.routeName: (context) => LoginPage(),
  HomePage.routeName: (context) => HomePage(),
  ListPage.routeName: (context) => ListPage(),
  ResultPage.routeName: (context) => ResultPage(),
  SettingPage.routeName: (context) => SettingPage(),
  MainPage.routeName: (context) => MainPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  IdPage.routeName: (context) => IdPage(),
  NoticePage.routeName: (context) => NoticePage(),
  VersionPage.routeName: (context) => VersionPage(),
  PasswordChangePage.routeName: (context) => PasswordChangePage(),
  FindID.routeName: (context) => FindID(),
  FindPassword.routeName: (context) => FindPassword(),
};
