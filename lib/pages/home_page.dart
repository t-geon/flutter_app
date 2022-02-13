import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("홈"),
      ),
      body: Center(child: Text("home page")),
    );
  }
}
