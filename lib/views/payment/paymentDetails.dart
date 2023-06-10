
import 'package:e_banking_app/Consts/constant.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../success/success.dart';

class PaymentDetails extends StatefulWidget {
  PaymentDetails({super.key});

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String cardNumber = "5450 7879 4864 7854",
      cardExpiry = "12/25",
      cardHolderName = "JOHN JABKKALLAH",
      bankName = "JABAKKALLAH Bank",
      cvv = "456";
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
              'Payment Details',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.0),
            Container(
              width: 400,
              height: 400,
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border.all(
                  width: 0.5,
                  color: kLightColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("My Personal Card",
                            style: TextStyle(fontSize: 18.0)),
                        Container(
                            width: 60.0,
                            child: Icon(Icons.payment,
                                color: kPrimaryColor, size: 40.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Number",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kLightColor,
                              ),
                            ),
                            Text(
                              cardNumber,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Exp.",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                cardExpiry,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Name",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kLightColor,
                              ),
                            ),
                            Text(
                              cardHolderName,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "VISA",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                cvv,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Transaction ID",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kLightColor,
                              ),
                            ),
                            Text(
                              "Total Amount",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 60.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "77366",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                "30 DH",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bill Type",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                "Transaction Date",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "IAM Bill",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                "19/05/2023",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*  Container(
                      height: 48.0,
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                          backgroundColor: kDarkColor.withOpacity(0.2),
                        ),
                        onPressed: () => print("Edit Detail"),
                        child: Text(
                          "Edit Detail",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      )),*/
                ],
              ),
            ),
            140.heightBox,
            ourButton(
                title: 'Pay',
                //textColor: Colors.white,
                color: Color.fromARGB(255, 100, 21, 255),
                onPress: () {
                  Get.to(() => Success(
                        title: 'You payment was done successfully',
                      ));
                }).box.width(context.screenWidth - 50).make(),
          ],
        ),
      ),
    );
  }
}
