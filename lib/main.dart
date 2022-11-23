 
import 'package:flutter/material.dart';
import 'package:myapp/authentication/loginpage.dart';
  
import 'package:myapp/pages/splash_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/home": (context) =>  LoginPage(),
      },
    ));
