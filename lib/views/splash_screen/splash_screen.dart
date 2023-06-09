import 'package:e_banking_app/Consts/const.dart';
import 'package:e_banking_app/views/auth_screen/login_screen.dart';
import 'package:e_banking_app/views/widgets_common/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ChangeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => const LoginScreen());
    });
  }

  @override
  void initState() {
    ChangeScreen();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //0077B5
    return  Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity ,
          width: double.infinity,
          //backgroundColor : const Color.fromARGB(0, 97, 21, 250),
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF181C2E), Color(0xFF6415FF),],
            ),
          ),
          child:Column(
            children: [
              //Image.
              170.heightBox,
              //boldText(text: "Welcome to our application", size: 16.0),
              40.heightBox,
              Center(
                child: Container(
                  width: 200,
                  child: Image.asset(logo)
                ),
              ),
              
            ],
          ),
        )
      )
    );
            
            
            
           
  }
}
