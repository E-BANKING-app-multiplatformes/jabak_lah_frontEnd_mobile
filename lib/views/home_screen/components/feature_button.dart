import 'package:e_banking_app/Consts/const.dart';
import 'package:velocity_x/velocity_x.dart';

Widget featureButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 40,
        //fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.color(darkFontGrey).make(),
    ],
  )
      .box
      .width(160)
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(const EdgeInsets.all(8))
      .roundedSM
      .make();
}
