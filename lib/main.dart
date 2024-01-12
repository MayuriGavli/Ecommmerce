//
// import 'dart:html';

// import 'dart:ui';

import 'package:flutter/material.dart';
import 'homePage.dart';
import 'loginPage.dart';

// static const IconData heart = IconData(0xf442, fontFamily: iconFont, fontPackage: iconFontPackage);

typedef void MyCallback(int foo);

class MyClass {
  void doSomething(int i) {}
}

class MyOtherClass {
  final MyCallback callback;

  MyOtherClass(this.callback);
}

void main() {
  runApp(const MaterialApp(
    // home: LoginPage(),
    home: HomePage(),
  ));
}