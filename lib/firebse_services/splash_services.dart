import 'dart:async';


import 'package:firebase_demo/ui/Auth/login_screen.dart';
import 'package:flutter/material.dart';
class SplashService{
  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }
}