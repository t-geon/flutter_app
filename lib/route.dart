import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/list_page.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/pages/result_page.dart';
import 'package:flutter_app/pages/setting_page.dart';
import 'package:flutter_app/pages/splash_page.dart';

final Map<String, WidgetBuilder> route = {
  SplashPage.routeName: (context) => SplashPage(),
  LoginPage.routeName: (context) => LoginPage(),
  HomePage.routeName: (context) => HomePage(),
  ListPage.routeName: (context) => ListPage(),
  ResultPage.routeName: (context) => ResultPage(),
  SettingPage.routeName: (context) => SettingPage(),
  MainPage.routeName: (context) => MainPage(),
};
