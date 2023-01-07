import 'package:flutter/material.dart';

List<Widget> icons = [];
List<String> questions = [
  'The Capital of France is Paris',
  'The Capital of Egypt is Cairo',
  'Alexandria is an Egyption City',
  'Mohamed Salah is a Football player',
  'The Capital of France is Paris',
  'The Capital of Egypt is Cairo',
  'Alexandria is an Egyption City',
  'Mohamed Salah is a Football player',
];
List<bool> answers = [
  true,
  true,
  false,
  true,
  false,
  false,
  true,
  false,
];
int all = questions.length;

int now = 0;
bool switch1 = false;
bool? stateanswer;

// class Question {
//   String realquestion;
//   bool realanswer;
//   Question({required bool a,required String q}) {
//     realquestion = q;
//     realanswer = a;
//   }
// }
