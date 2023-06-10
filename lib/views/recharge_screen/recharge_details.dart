import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Consts/constant.dart';
import '../../Controller/data_controllers.dart';
import '../../service/service.dart';
import '../success/success.dart';

import '../widgets_common/AppBar_widget.dart';
import '../widgets_common/headerLabel.dart';
import '../widgets_common/our_button.dart';
import 'RechargeOffres.dart';
import 'package:intl/intl.dart';

class RechargeDetails extends StatefulWidget {
  final int selectedOperatorIndex;
  const RechargeDetails({super.key, required this.selectedOperatorIndex});

  @override
  State<RechargeDetails> createState() => _RechargeDetailsState();
}

class _RechargeDetailsState extends State<RechargeDetails> {
  Service RechargeController = Get.put(Service());

  final DataController _controller = Get.put(DataController());

  var phonecontroller = TextEditingController();
  int selectedValue = -1;
  bool isPhoneValid = true;

  @override
  Widget build(BuildContext context) {
    final selectedOperatorImage = rechargeIcons[widget.selectedOperatorIndex];
    final selectedOperatorName = rechargeLabels[widget.selectedOperatorIndex];

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
          HeaderLabel(
            headerText: 'Enter your phone number',
          ),
          TextFormField(
            controller: RechargeController.phonecontroller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Phone Number",
              prefixIcon: Icon(
                Icons.phone_outlined,
                color: Colors.black,
              ),
              errorText: isPhoneValid ? null : 'Invalid phone format',
            ),
          ),
          HeaderLabel(
            headerText: 'Select your recharge ',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: rechargeList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: kPrimaryColor,
                    value: index,
                    groupValue: selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        selectedValue = value!;
                        // saveSelectedValueToJson(selectedValue);
                        print(selectedValue);
                        //  saveSelectedValueToDatabase(selectedValue); a definir dans un class controller
                      });
                    },
                  ),
                  title: Text(
                    rechargeList[index].toString(),
                    style: TextStyle(color: kDarkColor),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          ourButton(
            title: 'Next',
            color: Color.fromARGB(255, 100, 21, 255),
            onPress: () async {
              String phone = RechargeController.phonecontroller.text;
              bool isValid = validatePhone(phone);

              setState(() {
                isPhoneValid = isValid;
              });

              if (isValid) {
                // Créez un objet Map pour les données à enregistrer
                /* Map<String, dynamic> jsonData = {
                  'amount': rechargeList[selectedValue],
                  'creditor': _controller.xlist[selectedValue]['creditor'],
                  'date': DateTime.now().toString(),
                  'accountId': 3, // Remplacez par la valeur appropriée
                  'phoneNumber': phone,
                };*/

                // Chargez le contenu du fichier JSON existant
                /* Directory appDir = await getApplicationDocumentsDirectory();
                // String filePath = '${appDir.path}/data.json';
                File file = File('${appDir.path}/data.json');
                print("pathh found");
                List<Map<String, dynamic>> existingData = [];
                if (file.existsSync()) {
                  String fileContent = file.readAsStringSync();
                  var jsonData = json.decode(fileContent);
                  print("filecontent decoded");
                  if (jsonData is List) {
                    existingData = jsonData
                        .map((item) => item as Map<String, dynamic>)
                        .toList();
                  }
                }

                // Ajoutez les nouvelles données à la liste existante
                existingData.add(jsonData);
                print("jsondata added");
                print(existingData);*/
                final now = DateTime.now();

                // Formatter la date au format 'dd-MM-yyyy'
                final dateFormatter = DateFormat('yyyy-MM-dd');
                final formattedDate = dateFormatter.format(now);
                print('Formatted Date: $formattedDate');

                Map<String, dynamic> OurjsonData = {
                  "amount": rechargeList[selectedValue],
                  "creditor": rechargeLabels[widget.selectedOperatorIndex],
                  "date": formattedDate,
                  "accountId": 1,
                  "phoneNumber": phone,
                  // " description": "",
                  "creditorType": "RECHARGE"
                };
                print(widget.selectedOperatorIndex);
                print(rechargeIcons);
                print(selectedValue);
                print(OurjsonData);
                print(phone);
                //  print(jsonData);
                // RechargeController.sendDataToBackend(jsonData);
                //print("Data sent successfully");

                // Écrivez les données mises à jour dans le fichier JSON
                // file.writeAsStringSync(json.encode(existingData));

                // #### await sendDataToBackend(jsonData);
                Get.to(RechargeOffres(
                  selectedOperatorIndex: widget.selectedOperatorIndex,
                  rechargeList: rechargeIcons,
                  selectedRechargeIndex: selectedValue,
                  jsonData: OurjsonData,
                ));

                // Naviguez vers l'écran Success
                //  Get.to(Success(title: 'your payment was done successfully'));

                // Si vous souhaitez afficher le contenu du fichier JSON
                // print('Updated JSON content: ${file.readAsStringSync()}');
              }
            },
          ).box.width(context.screenWidth - 50).make(),
        ],
      ),
    );
  }
}

bool validatePhone(String phoneNumber) {
  final RegExp phoneRegex = RegExp(r'^\+212[0-9]{9}$');

  return phoneRegex.hasMatch(phoneNumber);
}

/*Future<void> saveSelectedValueToJson(int selectedValue) async {
  final jsonData = {'amount': rechargeList[selectedValue]};

  final jsonString = jsonEncode(jsonData);

  //final file =
  print("path found");
}*/


/*Future<void> sendDataToBackend(Map<String, dynamic> jsonData) async {
  try {
    var headers = {
      'Content-Type': 'application/json',
      //'Authorization':'Bearer $accessToken' // Include the access token in the headers
    };

    var url = Uri.parse(
        'http://192.168.1.7:8085/fim/est3Dgate/ABC123/makeTransaction'); // Replace with your endpoint URL

    http.Response response =
        await http.post(url, body: jsonEncode(jsonData), headers: headers);

    if (response.statusCode == 200) {
      print('Data sent successfully');
      var responseData = jsonDecode(response.body);
      // Handle the response data as needed

      print('Connection successful');
      print('Response: $responseData');
    } else {
      // Registration failed
      print('Recharging failed');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    Get.back();
    showDialog(
      context: Get.context!,
      builder: (context) {
        return SimpleDialog(
          title: Text("Error"),
          titlePadding: EdgeInsets.all(20),
          children: [Text(e.toString())],
        );
      },
    );
  }
}*/