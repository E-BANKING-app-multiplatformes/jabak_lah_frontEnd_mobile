import 'package:e_banking_app/Consts/colors.dart';
import 'package:e_banking_app/Consts/constant.dart';
import 'package:e_banking_app/Consts/images.dart';
import 'package:e_banking_app/service/service.dart';
import 'package:e_banking_app/views/auth_screen/login_screen.dart';
import 'package:e_banking_app/views/changepassword_screen/changepassword_screen.dart';
import 'package:e_banking_app/views/history_screen/history_screen.dart';
import 'package:e_banking_app/views/home_screen/Home.dart';
import 'package:e_banking_app/views/user_details/user_details.dart';
import 'package:e_banking_app/views/widgets_common/normal_text.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl ;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  //final Service profileControllerPage = Get.put(Service());
  late Service profileControllerPage;
  Client? client;
  
 @override
void initState() {
  super.initState();
  profileControllerPage = Get.put(Service());
  String clientId = Service.clientId.toString();

  profileControllerPage.fetchProfileData(clientId).then((data) {
    client = data;
    setState(() {});
  }).catchError((error) {
    // Gérer l'erreur lors de la récupération des données
    print('Erreur lors de la récupération des données: $error');
  });
}


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 226, 223, 223),
      appBar: AppBar(
        backgroundColor:purpleClair,
        title: const Text(
          "Your Account",
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        actions: [
          30.widthBox,
          Center(child: normalText(text: intl.DateFormat('EEE, MMM d , ''yy').format(DateTime.now()),color: whiteColor)),
          10.widthBox,
        ],
      ),
      body: client != null ?
        Padding(

        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //100.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(profileImage, width: 100,height:100),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       boldText(text:'${client!.firstName} ${client!.lastName}',color: Colors.black,size: 20.0),
                       //boldText(text:client.lastName,color: Colors.black,size: 20.0),
                    ],),
                  normalText(text:'${client!.email}',color:Colors.black,size: 20.0),
                  //const Divider(color: fontGrey,),
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              height: 60,
              width: context.screenWidth - 150,
              child: ourButton(
                color1: purpleClair,
                color: const Color.fromARGB(255, 226, 224, 224),
                title: "Change your Passsword",
                onPress: () {
                  Get.to(() => const ChangePassword());
                
                },
              ),
            ),
            10.heightBox,
            SizedBox(
              height: 60,
              width: context.screenWidth - 150,
              child: ourButton(
                color1: purpleClair,
                color: const Color.fromARGB(255, 226, 224, 224),
                title: "Show all transactions",
                onPress: () {
                  Get.to(() =>const HistoryScreen());
                
                },
              ),
            ),
            10.heightBox,
            SizedBox(
              height: 60,
              width: context.screenWidth - 150,
              child: ourButton(
                color1: purpleClair,
                color: const Color.fromARGB(255, 226, 224, 224),
                title: "User informations",
                onPress: () {
                  Get.to(() =>const  UserDetails());
                
                },
              ),
            ),
            10.heightBox,
            SizedBox(
              height: 60,
              width: context.screenWidth - 150,
              child: ourButton(
                color1: purpleClair,
                color: const Color.fromARGB(255, 226, 224, 224),
                title:
                "Logout",
                onPress: () {
                  Get.to(() => const LoginScreen());
                },
              ),
            ),
            
          ],
        ),
        )
        : Center(
            child: CircularProgressIndicator(),
          ),
    );
  }
}
