import 'package:e_banking_app/Consts/const.dart';
import 'package:e_banking_app/service/service.dart';
import 'package:e_banking_app/views/otp_number/otp.screen.dart';
import 'package:e_banking_app/views/widgets_common/normal_text.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  //final TextEditingController nameController = TextEditingController();
  //final TextEditingController emailController = TextEditingController();
  //final TextEditingController passwordController = TextEditingController();

  /*void register() {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // Implement your registration logic here
    // You can send the name, email, and password to your backend or perform any necessary validations

    print('Name: $name');
    print('Email: $email');
    print('Password: $password');
  }*/
//**************************************00 */
Service registationController =Get.put(Service());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visite as"),
        backgroundColor: purpleClair,
      ),
      body:Column(
            children: [
              //Image.
              230.heightBox,
              Center(
                child: Container(
                  width: 200,
                  child: Image.asset(logo, color: purpleClair,)
                ),
              ),
              50.heightBox,
              boldText(text: "Welcome to our application",color: red, size: 16.0),
              10.heightBox,
              boldText(text: "Visit our agency to create your account",color: purpleClair, size: 18.0),
              20.heightBox,
              normalText(text: "for more details                      ",color: red, size: 16.0),
              normalText(text: " Call us at +24495959596595",color: purpleClair, size: 16.0),
            ],
          ),
      /*
      appBar: AppBar(
        title: Text('Inscription'),
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:registationController.firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller:registationController.lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller:registationController.adressController,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller:registationController.CINController,
              decoration: InputDecoration(
                labelText: 'CIN',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller:registationController.phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller:registationController.birthDateController,
              decoration: InputDecoration(
                labelText: 'Birth Date',
                hintText: "dd/mm/yy"
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller:registationController.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: registationController.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            Center(
              child: SizedBox(
                height: 45,
                width: context.screenWidth - 150,
                child: ourButton(
                  title: "Create Account",
                  onPress: () async{
                    //registationController.regerterWithEmail();
                    Get.to(() =>  OtpScreen());
                  },
                ),
              ),
            ),
          ],
        ),
      ),*/
    );
  }
}
