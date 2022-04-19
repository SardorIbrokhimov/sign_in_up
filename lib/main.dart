import 'package:flutter/material.dart';
import 'package:sing_in_up/pages/sign_ui1.dart';
import 'package:sing_in_up/pages/sign_ui2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUi1(),
      routes: {
        SignUi1.id: (context) => SignUi1(),
        SignUi2.id: (context) => SignUi2(),
      },
    );
  }
}
