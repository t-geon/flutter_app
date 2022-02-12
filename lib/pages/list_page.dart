import 'package:flutter/material.dart';
import 'package:flutter_app/components/patient_card.dart';
import 'package:flutter_app/model/patient.dart';

//검사목록 페이지
class ListPage extends StatelessWidget {
  static String routeName = "/list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //배경 하얀색
      appBar: AppBar(
        title: Text("검사 목록"), //상단에 쓸거
      ),
      body: ListView(
        //리스트 생성
        children: List.generate(
          patients.length,
          (index) => PatientCard(patient: patients[index]),
        ),
      ),
    );
  }
}
