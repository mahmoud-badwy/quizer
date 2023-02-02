class Question {
  late String realquestion;
  late bool realanswer;
  Question({required bool a, required String q}) {
    realquestion = q;
    realanswer = a;
  }
}

List<Question> questionbank = [
  Question(q: 'cairo in egypt', a: true),
  Question(q: 'cairo in sodan', a: false),
  Question(q: 'cairo is egyption city', a: true),
  Question(q: 'alex in egypt', a: true),
  Question(q: 'alex in sodan', a: false),
];
