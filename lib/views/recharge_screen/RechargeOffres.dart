import 'package:e_banking_app/Consts/constant.dart';
import 'package:e_banking_app/views/otp_number/otp.screen.dart';
import 'package:e_banking_app/views/widgets_common/AppBar_widget.dart';
import 'package:e_banking_app/views/widgets_common/headerLabel.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../service/service.dart';
import '../success/success.dart';

class RechargeOffres extends StatefulWidget {
  final int selectedOperatorIndex;
  final int selectedRechargeIndex;
  final List<String> rechargeList;
  final Map<String, dynamic> jsonData; // Ajoutez cette ligne
//  final int selectedRechargeIndex;

  // final int selectedRechargeIndex;
  // Ajoutez cette ligne

  RechargeOffres(
      //selectedOperatorIndex,
      {
    super.key,
    required this.selectedOperatorIndex,
    //  required this.offreList,
    required this.rechargeList,
    required this.selectedRechargeIndex,
    required this.jsonData,
  });

  @override
  State<RechargeOffres> createState() => _RechargeOffresState();
}

class _RechargeOffresState extends State<RechargeOffres> {
  Service serv = Get.put(Service());
  // String accessToken = Service.getAccessToken()!;
  @override
  int selectedValue = -1;

  //************************* */
  int accountIdd = 0;

  @override
  void initState() {
    super.initState();
    someFunction();
    
  }

  
  String otpNumber = "";

  void someFunction() async {
    print("je suis dans RechargeOffere");
    print(Service.clientId);
    //print(Service.getAccountId());
    int accountId = await serv.fetchAccountId(Service.clientId);
    //String otp = serv.getOtpNumber()!;
    print("voici notre accountid");
    print(accountId);
    print("voici notre first otp");
    //print(otp);
   
    if (mounted) {
      setState(() {
        serv.otpNumber;
        accountIdd = accountId;
      });}
  }

  //******************* */
  @override
  Widget build(BuildContext context) {
    final OurjsonData = widget.jsonData;

    final selectedOperatorImage = rechargeIcons[widget.selectedOperatorIndex];
    final selectedOperatorName = rechargeLabels[widget.selectedOperatorIndex];

    List<String> offreList = [];
    if (widget.selectedRechargeIndex >= 0 &&
        widget.selectedRechargeIndex < widget.rechargeList.length) {
      // Vérifiez que l'index de la recharge sélectionnée est valide
      offreList = getOffresForRecharge(widget.selectedRechargeIndex);
    }
    print("aaaaaaaaaaaaaaaaaaaaaaa");
    print(widget.selectedOperatorIndex);
    print(widget.rechargeList);
    print(widget.selectedRechargeIndex);
    print(widget.jsonData);

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: CustomAppBar(
        title: "Recharge",
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey, // Couleur de fond du CircleAvatar
            child: ClipOval(
              child: Image.asset(
                selectedOperatorImage,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.heightBox,
          selectedOperatorName.text
              .fontFamily("sans_bold")
              .color(Colors.grey)
              .make(),
          10.heightBox,
          const HeaderLabel(
            headerText: 'Select your recharge offer ',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: offreList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: kPrimaryColor,
                    value: index,
                    groupValue: selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        selectedValue = value!;
                        //  if (jsonData != null) {
                        OurjsonData['description'] = offreList[index];
                        // jsonData['description'] = "*6";

                        // }
                      });
                    },
                  ),
                  title: Text(
                    offreList[index],
                    style: TextStyle(color: kDarkColor),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 45,
                width: context.screenWidth - 167,
                child: ourButton(
                  title: "GetOtp",
                  onPress: () async{
                    serv.verifyOtp(accountIdd);
                  },
                ),
              ),//controller:serv.otpController,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: TextFormField(
                  controller:serv.otpController,
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
            ],
          ),
          ourButton(
              title: 'Next',
              //textColor: Colors.white,
              color: Color.fromARGB(255, 100, 21, 255),
              onPress: () async {
                serv.otpNumber = serv.otpController.text.toString();
                print("voici variable static otp");
                print(serv.otpNumber);
                try {
                  Map<String, dynamic> testjsonData = {
                    "amount": 110.0,
                    "creditor": "IAM",
                    "date": "2023-06-08",
                    "accountId": 1,
                    "description": "*6",
                    "phoneNumber": "+212617093514",
                    "creditorType": "RECHARGE",
                    "address": "123 Main St"
                  };
                  //////////////////////////////////////////////////////////
                  await serv.sendDataToBackend(OurjsonData,serv.otpNumber);
                  print("---------Send Data Backend");
                  //print(serv.sendDataToBackend(OurjsonData));
                 // print(" successfully");
                } catch (e) {
                  print("recharge failed $e");
                }
                print(OurjsonData);
                //print("Data sent esuccessfully");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                      
                        Success(title: "Your recharge was done successfully"),
                  ),
                );
                //verifyOtp(1)
              }).box.width(context.screenWidth - 50).make(),
        ],
      ),
    );
  }
}

bool validatePhone(String phoneNumber) {
  final RegExp phoneRegex = RegExp(r'^\+212[0-9]{9}$');

  return phoneRegex.hasMatch(phoneNumber);
}

List<String> getOffresForRecharge(int rechargeIndex) {
  List<String> offreList = [];

  switch (rechargeIndex) {
    case 0:
      // Offres pour la recharge 0
      offreList = ['*1', '*2 ', '*3'];
      break;
    case 1:
      // Offres pour la recharge 1
      offreList = ['*1 ', '*2', '*3'];
      break;
    case 2:
      // Offres pour la recharge 1
      offreList = ['*1', '*2 ', '*3'];
      break;
    case 3:
      // Offres pour la recharge 1
      offreList = ['*1', '*2 ', '*3'];
      break;
    case 4:
      // Offres pour la recharge 1
      offreList = [
        '(*1) 4h valable 6j d' 'appels nationaux pour 30 dh',
        '(*2) 2H ou 3 GO 20j de validité pour 30 dh ',
        '(*3) 3Go valable 30j pour 30 dh'
      ];
      break;
    // Ajoutez des cas pour chaque recharge
  }

  return offreList;
}