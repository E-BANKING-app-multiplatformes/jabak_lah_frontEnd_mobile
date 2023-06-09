import 'package:e_banking_app/views/otp_number/otp.screen.dart';
import 'package:flutter/material.dart';
import 'package:e_banking_app/Consts/colors.dart';
import 'package:e_banking_app/service/service.dart';
import 'package:e_banking_app/views/home_screen/Home.dart';
import 'package:e_banking_app/views/widgets_common/normal_text.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class FirstChangePassword extends StatefulWidget {
  const FirstChangePassword({super.key});

  @override
  State<FirstChangePassword> createState() => _FirstChangePasswordState();
}

class _FirstChangePasswordState extends State<FirstChangePassword> {
  var firstlogin =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 15),
          normalText(text: "new password" , color: Colors.black, size: 30.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: TextFormField(
              //controller:,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                //hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color.fromARGB(255, 160, 159, 159)), // Couleur du contour
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color.fromARGB(255, 209, 209, 209)), // Couleur du contour lorsqu'en focus
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: SizedBox(
              height: 45,
              width: context.screenWidth - 107,
              child: ourButton(
                title: "Get OTP verification",
                onPress: () async{
                  Get.to(() =>  OtpScreen());
                  
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}