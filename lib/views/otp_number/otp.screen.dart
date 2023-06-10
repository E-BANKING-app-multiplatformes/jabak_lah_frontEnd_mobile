import 'package:e_banking_app/Consts/const.dart';
import 'package:e_banking_app/service/service.dart';
import 'package:e_banking_app/views/home_screen/Home.dart';
import 'package:e_banking_app/views/widgets_common/normal_text.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  Service otpControllerPage =Get.put(Service());
 


  @override
  Widget build(BuildContext context) {
    if (!Service.isFirstLogin) {
      // Rediriger vers la page Home si ce n'est pas la première authentification
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Get.offAll(() => Home());
      });
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 280),
            boldText(text:"Enter your Recived SMS Code",color:const Color.fromARGB(255, 7, 7, 7),size: 20.0),
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: TextFormField(
                controller: otpControllerPage.otpController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
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
            SizedBox(
              height: 60,
            ),
            Center(
              child: SizedBox(
                height: 45,
                width: context.screenWidth - 160,
                child: ourButton(
                  title: "Valider",
                  color: purpleClair,
                  onPress: () {
                    print("je suis dans otpscreen");
                    //otpControllerPage.verifyOtp(1);
                    
                    Get.to(() => const Home());
                  },
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}