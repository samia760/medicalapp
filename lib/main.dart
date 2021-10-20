import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_page/Welcome.dart';

import 'package:login_page/homepage.dart';
import 'package:login_page/map.dart';
import 'package:login_page/placeslists.dart';
import 'package:login_page/splash.dart';
import 'package:provider/provider.dart';



//import 'package:login_page/signup_page.dart';

void main() {
//  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        debugShowCheckedModeBanner: false,
       
      title: 'Login Page',
      
    home:Welcome(),
     
      
    );
      
  }
}
 





