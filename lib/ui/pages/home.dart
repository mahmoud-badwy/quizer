// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:quizer/data/data.dart';
import 'package:quizer/data/modules/logic.dart';
import 'package:quizer/data/question_module.dart';
import 'package:quizer/ui/widget/column.dart';
import 'package:quizer/ui/widget/row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyDialog myanswerdialog = MyDialog();
  MyDialog resetdata = MyDialog();

  gettrue() {
    if (now + 1 == all) {
      if (questionbank[now].realanswer == false) {
        setState(
          () {
            icons.add(
              const Icon(Icons.check, color: Colors.green),
            );
          },
        );
      } else {
        setState(
          () {
            icons.add(
              const Icon(Icons.close, color: Colors.red),
            );
          },
        );
      }
      myanswerdialog.showMyDialog(
        conu: context,
        title: 'Succed',
        bodytext: 'You are finnish all questions.',
        button1: 'show result',
        button2: 'cancle',
        button1f: () {
          setState(() {
            now = 0;
            icons.clear();
          });
        },
      );
    } else {
      if (questionbank[now].realanswer == true) {
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

  getfalse2() {
    if (now + 1 == all) {
      if (questionbank[now].realanswer == false) {
        setState(
          () {
            icons.add(
              const Icon(Icons.check, color: Colors.green),
            );
          },
        );
      } else {
        setState(
          () {
            icons.add(
              const Icon(Icons.close, color: Colors.red),
            );
          },
        );
      }
      myanswerdialog.showMyDialog(
        conu: context,
        title: 'Succed',
        bodytext: 'You are finnish all questions.',
        button1: 'show result',
        button2: 'cancle',
        button1f: () {},
      );
    } else {
      if (questionbank[now].realanswer == false) {
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
              resetdata.showMyDialog(
                conu: context,
                title: 'reset your progress',
                bodytext: 'Are you sure ?',
                button1: 'reset my progress',
                button2: 'cancle',
                button1f: () {
                  setState(() {
                    now = 0;
                    icons.clear();
                  });
                },
              );
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
                  ? getcolumn(st1: gettrue, st2: getfalse2)
                  : getrow(st1: gettrue, st2: getfalse2),
            ),
            SizedBox(
              height: 30,
              child: SingleChildScrollView(
                reverse: true,
                clipBehavior: Clip.antiAlias,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: icons,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/*
Future<void> showMyDialog(
    {required BuildContext con,
    required String title,
    required String bodytext,
    required String button}) async {
  return showDialog<void>(
    context: con,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(bodytext),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(button),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            width: 100,
          ),
          TextButton(
            child: Text(button),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
 */