// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:quizer/data/data.dart';
import 'package:quizer/data/modules/logic.dart';
import 'package:quizer/data/question_module.dart';
import 'package:quizer/ui/pages/show_result.dart';
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
      if (questionbank[now].realanswer == true) {
        useranswers.add(true);
        useranswersc = useranswers.length;
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
        button2: 'cancel',
        button1f: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowResult(
                all: all.toDouble(),
                result: useranswersc.toDouble(),
              ),
            ),
          );
        },
        button2f: () {
          setState(() {
            now = 0;
            icons.clear();
            useranswers.clear();
            useranswersc = 0;

            Navigator.of(context).pop();
          });
        },
        button3: 'reset progress',
      );
    } else {
      if (questionbank[now].realanswer == true) {
        useranswers.add(true);
        useranswersc = useranswers.length;
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
        useranswers.add(true);
        useranswersc = useranswers.length;
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
        button2: 'cancel',
        button1f: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowResult(
                all: all.toDouble(),
                result: useranswersc.toDouble(),
              ),
            ),
          );
        },
        button2f: () {
          setState(() {
            now = 0;
            icons.clear();
            useranswers.clear();
            useranswersc = 0;
            Navigator.of(context).pop();
          });
        },
        button3: 'reset progress',
      );
    } else {
      if (questionbank[now].realanswer == false) {
        useranswers.add(true);
        useranswersc = useranswers.length;
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
              resetdata.showMyDialog2(
                conu: context,
                title: 'reset your progress',
                bodytext: 'Are you sure ?',
                button1: 'reset my progress',
                button2: 'cancel',
                button1f: () {
                  setState(() {
                    now = 0;
                    icons.clear();
                    useranswers.clear();
                    useranswersc = 0;
                    Navigator.of(context).pop();
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
