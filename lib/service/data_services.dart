import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataServices {
  Future<List<dynamic>> getUsers() async {
    var info = rootBundle.loadString("json/data.json");
    List<dynamic> list = json.decode(await info);
    return Future.delayed(
        Duration(seconds: 5),
        //  print(list);
        () => list.map((e) => e).toList());
  }
}
