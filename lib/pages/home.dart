// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:quizer/data/data.dart';
import 'package:quizer/data/question_module.dart';
import 'package:quizer/widget/column.dart';
import 'package:quizer/widget/row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  gettrue2() {
    if (now + 1 == all) {
    } else {
      if (questionbank[now].realanswer) {
        setState(
          () {
            icons.add(
              const Icon(Icons.check, color: Colors.green),
            );
            now++;
          },
        );
      } else {
        setState(
          () {
            icons.add(
              const Icon(Icons.close, color: Colors.red),
            );
            now++;
          },
        );
      }
    }
  }

  getfalse2() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x4D100D2C),
      appBar: AppBar(
        backgroundColor: const Color(0x4D100D2C),
        leading: Switch(
          thumbColor: MaterialStateProperty.resolveWith<Color>(
            (s) {
              if (!switch1) {
                return Colors.red;
              }
              return Colors.green;
            },
          ),
          trackColor: MaterialStateProperty.resolveWith<Color>(
            (s) {
              if (!switch1) {
                return Colors.greenAccent;
              }
              return Colors.redAccent;
            },
          ),
          onChanged: (b) {
            setState(
              () {
                switch1 = b;
              },
            );
          },
          value: switch1,
        ),
        title: const Text('Quizer App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                now = 0;
                icons.clear();
              });
            },
            icon: const Icon(Icons.restore),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${now + 1} / $all',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                questionbank[now].realquestion,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            Expanded(
              child: switch1 == false
                  ? getcolumn(st1: gettrue2, st2: getfalse2)
                  : getrow(st1: gettrue2, st2: getfalse2),
            ),
            SizedBox(
              height: 30,
              child: ListView(
                children: icons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
