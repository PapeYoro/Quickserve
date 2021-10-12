import 'package:flutter/material.dart';
import 'package:microserve/screens/Login/signup.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'QuickServe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Signup(),
    );
  }
}
