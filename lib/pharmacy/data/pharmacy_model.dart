class Pharmacy_Model {
  bool? success;
  String? message;
  List<DataPharmacy>? data;

  Pharmacy_Model({this.success, this.message, this.data});

  Pharmacy_Model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataPharmacy>[];
      json['data'].forEach((v) {
        data!.add(new DataPharmacy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPharmacy {
  int? id;
  String? name;
  String? price;
  int? quantity;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;
  Image? image;

  DataPharmacy(
      {this.id,
      this.name,
      this.price,
      this.quantity,
      this.expiryDate,
      this.createdAt,
      this.updatedAt,
      this.image});

  DataPharmacy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['expiry_date'] = this.expiryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  int? id;
  String? path;
  String? imageableType;
  int? imageableId;
  String? createdAt;
  String? updatedAt;

  Image(
      {this.id,
      this.path,
      this.imageableType,
      this.imageableId,
      this.createdAt,
      this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    imageableType = json['imageable_type'];
    imageableId = json['imageable_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['imageable_type'] = this.imageableType;
    data['imageable_id'] = this.imageableId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
