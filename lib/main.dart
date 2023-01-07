import 'package:flutter/material.dart';
import 'package:quizer/pages/home.dart';

void main() {
  runApp(const Quizer());
}
class Quizer extends StatelessWidget {
  const Quizer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage() ,
    );
  }
}
