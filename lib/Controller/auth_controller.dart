import 'package:get/get.dart';

class ClientController extends GetxController {
  RxInt clientId = RxInt(0);

  void setClientId(int id) {
    clientId.value = id;
  }
}