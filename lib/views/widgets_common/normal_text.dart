import 'package:e_banking_app/Consts/const.dart';
import 'package:velocity_x/velocity_x.dart';
Widget normalText({text,color=Colors.white,size=14.0}){
  return "$text".text.color(color).size(size).make();
}
Widget boldText({text,color=Colors.white,size=16.0}){ 
  return "$text".text.semiBold.color(color).size(size).make();
}