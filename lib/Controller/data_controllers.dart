import 'package:e_banking_app/service/data_services.dart';
import 'package:e_banking_app/service/service.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var list = [].obs;
  final service = new Service();
  var _loading = false.obs;

  get loading => _loading.value;

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  get newList => list.where((e) => e["status"] ?? false).map((e) => e).toList();

  _loadData() async {
    _loading.value = false;
    try {
      DataServices controle = Get.put(DataServices());
      var info = controle.getUsers();
      list.addAll(await info);
    } catch (e) {
      print("Encountred Error!");
      print(e);
    } finally {
      _loading.value = true;
    }
  }

  List<Map<String, dynamic>> xlist = [
    {
      "amount": 12.0,
      "creditor": "Maroc Telecom",
      "date": "2023-05-22",
      "accountId": 1,
      "phoneNumber": "456789011"
    },
    {
      "amount": 12.0,
      "creditor": "Inwi",
      "date": "2023-05-22",
      "accountId": 2,
      "phoneNumber": "456789011"
    },
    {
      "amount": 12.0,
      "creditor": "Orange",
      "date": "2023-05-22",
      "accountId": 3,
      "phoneNumber": "456789011"
    },
  ];
}