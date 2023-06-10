import 'package:e_banking_app/views/auth_screen/login_screen.dart';
import 'package:e_banking_app/views/home_screen/Home.dart';
import 'package:e_banking_app/views/otp_number/otp.screen.dart';
import 'package:e_banking_app/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
   
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "login",
      home: SplashScreen(),
    );
  }
}
