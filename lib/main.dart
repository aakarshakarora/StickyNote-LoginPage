import 'package:flutter/material.dart';
import 'package:Notes/pages/StickyNote/ui/home.dart';
import 'package:Notes/pages/loginpage.dart';



void main() => runApp(new MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new Home(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: routes,
    );
  }
}
