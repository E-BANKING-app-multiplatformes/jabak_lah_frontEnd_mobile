
import 'package:e_banking_app/Consts/constant.dart';
import 'package:e_banking_app/views/success/success.dart';
import 'package:e_banking_app/views/widgets_common/headerLabel.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';


class Payment extends StatefulWidget {
  Payment({super.key});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors
            .transparent, // Définir la couleur d'arrière-plan de l'AppBar comme transparente
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Gérer l'appui sur le bouton de retour
          },
        ),
        titleSpacing: 0.0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/LogoWithoutText.png',
                height: 36,
                width: 36,
              ),
            ),
            Text(
              'Payment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Action du bouton de notification
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF181C2E), Color(0xFF6415FF), Color(0xFF6415FF)],
              begin: Alignment.topRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          HeaderLabel(
            headerText: 'Your payment method',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: kPrimaryColor,
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = i as int),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: TextStyle(color: kDarkColor),
                  ),
                  trailing: Icon(paymentIcons[index], color: kPrimaryColor),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          ourButton(
              title: 'Next',
              //textColor: Colors.white,
              color: Color.fromARGB(255, 100, 21, 255),
              onPress: () {
                Get.to(
                    () => Success(title: "Your payment was done successfully"));
              }).box.width(context.screenWidth - 50).make(),
        ],
      ),
    );
  }
}
