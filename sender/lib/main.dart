import 'package:flutter/material.dart';
import 'package:sender/constants/colors.dart';
import 'package:sender/widget/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sender',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: primaryBackground,
        scaffoldBackgroundColor: primaryBackground,
        canvasColor: primaryBackground,
        fontFamily: 'Nunito',
      ),
      home: const HomePage(),
    );
  }
}
