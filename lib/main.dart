// import 'dart:ffi';
// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:ramene/view/login.dart';
import 'package:ramene/onboarding_page.dart';
import 'package:ramene/view/bebas.dart';
import 'package:ramene/myhomepage.dart';
import 'package:ramene/view/login.dart';

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: themeData,
      /* fungsi set theme dijadikan sebuah parameter pada home page
      agar dapat dijalankan pada class tersebut */
      home: OnBoard(),
      // home: Home_Page(setTheme: setTheme),
    );
  }
}
