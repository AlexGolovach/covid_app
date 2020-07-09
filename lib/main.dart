import 'package:covidapp/di/service_locator.dart';
import 'package:covidapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(CovidApp());
}

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid App',
        theme: ThemeData(brightness: Brightness.light, fontFamily: "Avenir"),
        home: HomeScreen());
  }
}
