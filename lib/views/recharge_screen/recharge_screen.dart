import 'dart:convert';
import 'dart:io';

import 'package:e_banking_app/views/recharge_screen/recharge_details.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Consts/constant.dart';

import '../widgets_common/AppBar_widget.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Recharge",
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            "Select your operator :"
                .text
                .size(30)
                .color(kLightColor)
                .fontFamily("sans_bold")
                .make(),
            10.heightBox,
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    mainAxisExtent: 200),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        rechargeIcons[index],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      // const Spacer(),
                      10.heightBox,
                      rechargeLabels[index]
                          .text
                          .fontFamily("sans_bold")
                          .color(Colors.grey)
                          .make(),
                      10.heightBox,
                      "Recharges"
                          .text
                          .color(Colors.blue)
                          .fontFamily("sans_bold")
                          .size(16)
                          .make(),
                    ],
                  )
                      .box
                      .white
                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                      .roundedSM
                      .padding(const EdgeInsets.all(12))
                      .make()
                      .onTap(() async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            RechargeDetails(selectedOperatorIndex: index),
                      ),
                    );
                  });
                })
          ],
        ),
      ),
    );
  }
}

Future<void> saveSelectedOperatorToJson(String selectedOperator) async {
  Directory appDir = await getApplicationDocumentsDirectory();
  File file = File('${appDir.path}/data.json');

  if (file.existsSync()) {
    String fileContent = file.readAsStringSync();
    List<dynamic> existingData = json.decode(fileContent);

    Map<String, dynamic> newData = {
      'amount': 12.0,
      'creditor': selectedOperator,
      'date': DateTime.now().toString(),
      'accountId': selectedOperator,
      'phoneNumber': '456789011',
    };

    existingData.add(newData);

    file.writeAsStringSync(json.encode(existingData));
    print(existingData);
  }
}