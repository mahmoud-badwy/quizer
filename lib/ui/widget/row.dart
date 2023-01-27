import 'package:flutter/material.dart';

Row getrow({required VoidCallback st1, required VoidCallback st2}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap: () {
          st1();
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
        onTap: st2,
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
  );
}
