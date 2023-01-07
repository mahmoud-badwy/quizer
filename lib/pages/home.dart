// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:quizer/data/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                questions[now],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            Expanded(
              child: switch1 == false
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: GestureDetector(
                            onTap: () {
                              if (now + 1 == all) {
                              } else {
                                setState(() {
                                  icons.add(
                                    const Icon(Icons.check,
                                        color: Colors.green),
                                  );
                                  now++;
                                });
                              }
                            },
                            child: Container(
                              height: 75,
                              width: double.infinity,
                              alignment: Alignment.center,
                              color: Colors.green,
                              child: const Text(
                                "TRUE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            right: 17,
                            left: 17,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              stateanswer = false;
                              if (now  == all) {
                              } else {
                                if (answers[now]) {
                                  setState(
                                    () {
                                      icons.add(
                                        const Icon(Icons.close,
                                            color: Colors.red),
                                      );
                                      now++;
                                    },
                                  );
                                } else {
                                  setState(
                                    () {
                                      icons.add(
                                        const Icon(Icons.check,
                                            color: Colors.green),
                                      );
                                      now++;
                                    },
                                  );
                                }
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 75,
                              alignment: Alignment.center,
                              color: Colors.red,
                              child: const Text(
                                "FALSE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (now + 1 == all) {
                            } else {
                              setState(() {
                                icons.add(
                                  const Icon(Icons.check, color: Colors.green),
                                );
                                now++;
                              });
                            }
                          },
                          child: const CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.check,
                              size: 35,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (now + 1 == all) {
                              // await AwesomeDialog(
                              //   context: context,
                              //   dialogType: DialogType.success,
                              //   title: 'title',
                              //   closeIcon: Icon(Icons.close),
                              // ).show();
                            } else {
                              setState(() {
                                icons.add(
                                  const Icon(Icons.close, color: Colors.red),
                                );
                                now++;
                              });
                            }
                          },
                          child: const CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.close,
                              size: 35,
                            ),
                          ),
                        )
                      ],
                    ),
            ),
            SizedBox(
              height: 30,
              child: Row(
                children: icons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
