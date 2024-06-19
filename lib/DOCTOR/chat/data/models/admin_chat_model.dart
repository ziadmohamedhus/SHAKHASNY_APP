class AdminMessageModel {
  int? id;
  String? name;
  String? time;

  AdminMessageModel({this.name, this.id});

  AdminMessageModel.fromJSon(json) {
    name = json['name'] as String?;
    id = json['userId'] as int?;
    time = json['lastUpdated'].toString();
  }
}
