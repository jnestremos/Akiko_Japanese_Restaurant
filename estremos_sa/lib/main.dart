import 'package:estremos_sa/screens/HomeScreen.dart';
import 'package:estremos_sa/screens/HomeScreenLandscape(Test).dart';
import 'package:estremos_sa/screens/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estremos SA',
      theme: ThemeData(
          primaryColor: Color(0xFFFEDE00), buttonColor: Color(0xFFFEDE00)),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
