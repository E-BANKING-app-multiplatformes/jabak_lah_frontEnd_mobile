import 'dart:convert';

import 'package:e_banking_app/Consts/colors.dart';
import 'package:e_banking_app/Consts/const.dart';
import 'package:e_banking_app/Consts/string.dart';
import 'package:e_banking_app/service/service.dart';
import 'package:e_banking_app/views/auth_screen/inscription.dart';
import 'package:e_banking_app/views/home_screen/Home.dart';
import 'package:e_banking_app/views/home_screen/home_screen.dart';
import 'package:e_banking_app/views/otp_number/otp.screen.dart';
import 'package:e_banking_app/views/widgets_common/normal_text.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Service loginController =Get.put(Service());
//'eve.holt@reqres.in'
//'pistol'
   

  //TextEditingController emailController = TextEditingController();
  //TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                children: [
                  130.heightBox,
                  Center(
                    child: Container(
                      width: 200,
                      child: Image.asset(logo)
                    ),
                  ),
                  70.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        20.heightBox,
                        Row(children:[ 
                          20.widthBox,
                          normalText(text:email,color: Colors.black)]),
                        6.heightBox,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: loginController.emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              //hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color:  Color.fromARGB(255, 160, 159, 159)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color:  Color.fromARGB(255, 209, 209, 209)), // Couleur du contour lorsqu'en focus
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(children:[ 
                          20.widthBox,
                          normalText(text:password,color:Colors.black)]),
                        6.heightBox,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller:loginController.passwordController,
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
                        SizedBox(height: 10),
                        // Row(
                        //   children: [
                        //     2.widthBox,
                        //     Checkbox(
                        //       value: false, // Ajoutez une valeur booléenne ici pour gérer l'état de la case à cocher
                        //       onChanged: (value) {
                        //         // Ajoutez votre logique ici pour gérer le changement d'état de la case à cocher
                        //       },
                        //     ),
                        //     normalText(text: rememberMe, color: Colors.black,size: 10.0),
                        //     35.widthBox,
                        //     Align(
                        //       alignment: Alignment.centerRight,
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           // Ajoutez votre logique ici pour gérer l'appui sur le texte "forget password"
                        //         },
                        //         child: normalText(text: forgetPassword , color:Colors.purple, size: 10.0),
                        //       ),
                        //     ),

                        //   ],
                        // ),
                        30.heightBox,
                        Center(
                          child: SizedBox(
                            height: 45,
                            width: context.screenWidth - 107,
                            child: ourButton(
                              title: login,
                              onPress: () async{
                                Service.login(loginController.emailController,loginController.passwordController);
                                //Get.to(() => const Home());
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: SizedBox(
                            height: 45,
                            width: context.screenWidth - 107,
                            child: ourButton(
                              title: "Create Account",
                              onPress: () async{
                                Get.to(() =>  InscriptionPage());
                               
                              },
                            ),
                          ),
                        ),
                      ]
                    ).box
                    .width(300)
                    .height(350)
                    .color(Colors.white)
                    .border(color: whiteColor)
                    .rounded
                    .shadowMd
                    .padding(const EdgeInsets.all(8))
                    .make(),
                  ),
                
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}