import 'package:flutter/material.dart';

class ShowResult extends StatelessWidget {
  late double result;
  late double all;

  ShowResult({super.key, required this.all, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x4D100D2C),
      appBar: AppBar(
        backgroundColor: const Color(0x4D100D2C),
        centerTitle: true,
        title: const Text('Show Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'your result is :',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFFFFFFF),
                    width: 5.0,
                    style: BorderStyle.solid,
                    strokeAlign: StrokeAlign.inside,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 200,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${result.toInt()}',
                      style: TextStyle(
                          fontSize: 28,
                          color: all / result <= 2 ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFFFFFFFF),
                      ),
                      height: 5,
                    ),
                    Text(
                      '${all.toInt()}',
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            MaterialButton(
              color: Colors.red,
              hoverColor: Colors.green,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go To Exam'),
            ),
          ],
        ),
      ),
    );
  }
}
