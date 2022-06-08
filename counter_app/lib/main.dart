import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          color: Colors.purple,
          child: Container(
            height: 200,
            width: 200,
            color: Colors.greenAccent,
          )
      ),
    )
  ));
}