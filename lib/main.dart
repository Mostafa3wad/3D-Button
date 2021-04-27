import 'package:flutter/material.dart';
import 'package:magical_button/3d_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('3D Button'),
        ),
        body: Center(
            child: MyButton(
          child: Text('My Button'),
          color: Colors.blue,
          onTap: () {},

        )),
      ),
    );
  }
}
