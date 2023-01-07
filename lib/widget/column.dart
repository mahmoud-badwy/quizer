import 'package:flutter/material.dart';

Column getcolumn({required VoidCallback st1, required VoidCallback st2}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.all(17.0),
        child: GestureDetector(
          onTap: st1,
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
          onTap: st1,
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
  );
}



/* 
 if (now + 1 == all) {
            } else {
              setState(() {
                icons.add(
                  const Icon(Icons.check, color: Colors.green),
                );
                now++;
              });
            }
            =======================================
             if (now == all) {
            } else {
              if (questionbank[now].realanswer) {
                setState(
                  () {
                    icons.add(
                      const Icon(Icons.close, color: Colors.red),
                    );
                    now++;
                  },
                );
              } else {
                setState(
                  () {
                    icons.add(
                      const Icon(Icons.check, color: Colors.green),
                    );
                    now++;
                  },
                );
              }
            }
            */



