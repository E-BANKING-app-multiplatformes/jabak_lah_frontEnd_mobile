
import 'package:e_banking_app/Consts/constant.dart';
import 'package:e_banking_app/Controller/data_controllers.dart';
import 'package:e_banking_app/views/payment/payment.dart';
import 'package:e_banking_app/views/widgets_common/AppBar_widget.dart';
import 'package:e_banking_app/views/widgets_common/our_button.dart';
import 'package:e_banking_app/views/widgets_common/text_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';


class FactureScreen extends StatefulWidget {
  const FactureScreen({Key? key}) : super(key: key);

  @override
  State<FactureScreen> createState() => _FactureScreenState();
}

class _FactureScreenState extends State<FactureScreen> {
  final DataController _controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    print(_controller.list);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Bills ",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'My Bills',
              style: TextStyle(
                color: kLightColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Obx(() {
            if (_controller.loading == false) {
              return Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Expanded(
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: _controller.list.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20, right: 20),
                        height: 130,
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFd8dbe0),
                              offset: Offset(1, 1),
                              blurRadius: 20.0,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, left: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            width: 3,
                                            color: Colors.grey,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(_controller
                                                .list[index]["image"]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _controller.list[index]["operator"],
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
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
                                    ],
                                  ),
                                  Sizedtext(
                                    text: _controller.list[index]["more"],
                                    color: Colors.green,
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _controller.list[index]["status"] =
                                          !_controller.list[index]["status"];
                                      print(_controller.list[index]["status"]);
                                      _controller.list.refresh();
                                      print(_controller.newList.length);
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: _controller.list[index]
                                                    ["status"] ==
                                                false
                                            ? Color.fromARGB(255, 232, 230, 230)
                                            : Colors.green,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Select",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: _controller.list[index]
                                                        ["status"] ==
                                                    false
                                                ? kLightColor
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    "\$" + _controller.list[index]["due"],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: kDarkColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const Text(
                                    "Due in 3 days",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF9ca2ac),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                              Container(
                                width: 5,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Color(0xFF646f88),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          }),
          ourButton(
            title: 'Pay a Bill',
            //textColor: Colors.white,
            color: Color.fromARGB(255, 100, 21, 255),
            onPress: () {
              Get.to(Payment());
            },
          ).box.width(context.screenWidth - 50).make(),
        ],
      ),
    );
  }
}
