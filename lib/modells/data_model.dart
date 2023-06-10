class DataModel {
  String operator_name;
  String operator_logo;
  int status;
  String due_info;
  String due;
  DataModel(
      {required this.operator_name,
      required this.operator_logo,
      required this.status,
      required this.due_info,
      required this.due});
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        operator_name: json["oprator_name"],
        operator_logo: json["operator_logo"],
        status: json["status"],
        due: json["due"].toString(),
        due_info: json["due_info"]);
  }
}
