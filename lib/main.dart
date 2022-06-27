import 'package:flutter/material.dart';
import 'package:flutter_ui_projects/apps.dart';
import 'package:flutter_ui_projects/apps/google_keep/keep.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const Keep(),
    );
  }
}
