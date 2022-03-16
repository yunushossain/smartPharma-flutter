import 'package:flutter/material.dart';
import 'package:smartpharma/page/login_page.dart';
import 'package:smartpharma/screen/dashboard.dart';

import 'bottom_navigation_bar.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: LoginPage(),

    );
  }
}
