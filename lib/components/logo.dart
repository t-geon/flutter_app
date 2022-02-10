import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final String title;
  const Logo(this.title); //title로 전달 되는게 문구

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          //로고 삽입
          "assets/logo.svg", //해당 경로에 있는 logo.svg 삽입
          height: 70, //크기 설정
          width: 70,
        ),
        Text(
          //문자 스타일
          title,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
