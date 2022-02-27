import 'package:flutter/material.dart';
import 'package:flutter_app/components/setting_custtom.dart';

//설정화면
class SettingPage extends StatelessWidget {
  static String routeName = "/setting";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("설정"),
      ),
      body: SingleChildScrollView(
        child: SettingCustom(),
      ),
    );
  }
}
