import 'package:e_banking_app/Controller/data_controllers.dart';
import 'package:e_banking_app/views/home_screen/home_screen.dart';
import 'package:e_banking_app/views/widgets_common/emptySection.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:e_banking_app/views/widgets_common/subTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Consts/constant.dart';
import '../home_screen/Home.dart';

class Success extends StatefulWidget {
  String title;
  Success({required this.title});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  final DataController _controller = Get.put(DataController());
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < _controller.newList.length; i++) {
      totalAmount += double.parse(_controller.list[i]["due"]);
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: success,
            emptyMsg: 'Successful !!',
          ),
          SubTitle(
            subTitleText: widget.title,
          ),
          Container(
            height: 160,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Colors.grey.withOpacity(0.5)),
            ),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                itemCount: _controller.newList.length,
                itemBuilder: (_, index) {
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.done,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _controller.newList[index]["operator"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "ID: 123456",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kLightColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "\$" + _controller.newList[index]["due"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.grey.withOpacity(0.5),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Column(
            children: [
              Text(
                "Total Amount",
                style: TextStyle(
                  fontSize: 20,
                  color: kLightColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "\$" + totalAmount.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 30,
                    color: kDarkColor,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          ourButton(
            title: 'Ok',
            //textColor: Colors.white,
            color: Color.fromARGB(255, 100, 21, 255),
            onPress: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            ),
          ).box.width(context.screenWidth - 50).make(),
        ],
      ),
    );
  }
}
