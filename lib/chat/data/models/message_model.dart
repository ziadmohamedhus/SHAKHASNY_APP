class MessageModel {
  late String message;
  late String userId;
  late String pId;
  late String createdAt;
  late bool isRead;
  late bool isuser;

  MessageModel(
      {required this.message,
      required this.isuser,
      required this.userId,
      required this.pId,
      required this.createdAt,
      required this.isRead});

  MessageModel.fromJSon(json) {
    message = json['message'];
    isuser = json['is_user'];
    userId = json['userId'];
    createdAt = json['createdAt'].toString();
    isRead = json['isRead'];
    pId = json['pId'];
  }
}
