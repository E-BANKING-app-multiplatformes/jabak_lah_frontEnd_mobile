import 'package:e_banking_app/Consts/colors.dart';
import 'package:e_banking_app/service/service.dart';
import 'package:e_banking_app/views/home_screen/Home.dart';
import 'package:e_banking_app/views/home_screen/home_screen.dart';
import 'package:e_banking_app/views/widgets_common/normal_text.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDetailsScreen extends StatefulWidget {
  final Transaction transaction;

  const HistoryDetailsScreen({required this.transaction});

  @override
  State<HistoryDetailsScreen> createState() => _HistoryDetailsScreenState();
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleClair,
        title: const Text(
          "Transaction Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction Date: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: purpleClair,
                    ),
                  ),
                  boldText(text:"${widget.transaction.date}",color: Colors.orange)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction Name: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: purpleClair,
                    ),
                  ),
                   boldText(text:"${widget.transaction.creditor}",color: Colors.orange)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amount: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color:purpleClair,
                    ),
                  ),
                  boldText(text:"${widget.transaction.amount}",color: Colors.orange)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction Description: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: purpleClair,
                    ),
                  ),
                   boldText(text:"${widget.transaction.description}",color: Colors.orange)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone Number: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: purpleClair,
                    ),
                  ),
                   boldText(text:"${widget.transaction.phoneNumber}",color: Colors.orange)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Creditor Type: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: purpleClair,
                    ),
                  ),
                   boldText(text:"${widget.transaction.creditorType}",color: Colors.orange)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction Status: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: purpleClair,
                    ),
                  ),
                   boldText(text:"${widget.transaction.transactionStatus}",color: Colors.orange)
                ],
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ourButton(
                color: Colors.orange,
                title: "Home",
                onPress: () async {
                  Get.to(() => const Home());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
