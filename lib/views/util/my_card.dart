import 'package:flutter/material.dart';
import 'package:e_banking_app/Consts/const.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:e_banking_app/views/widgets_common/normal_text.dart';


class MyCard extends StatelessWidget {
  final double balance;
  final color;
  const MyCard({
    Key? key,
    required this.balance,
    required this.color,
    }) :super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(
                  width: 190),
                Image.asset(visa2, width: 50,),
              ],
            ),
            const SizedBox(height: 10),
            normalText(text:'Balance', color: whiteColor),
            const SizedBox(height: 12),
            normalText(text:'\$'+ balance.toString(), color: whiteColor, size: 28.0),
            const SizedBox(height: 44),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                normalText(text:"".toString(), color: whiteColor),
                normalText(text: "".toString(), color: whiteColor),
              ],
            )
          ],
        ),
              ),
    );
  }
}