import 'package:flutter/material.dart';
import 'package:loginPage/pages/loginpage.dart';

import 'pages/homepage.dart';

void main() => runApp(new MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: routes,
    );
  }
}
