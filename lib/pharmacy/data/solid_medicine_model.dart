class Solid_Medicine_Model {
  bool? success;
  String? message;
  List<DataSolidMedicine>? data;

  Solid_Medicine_Model({this.success, this.message, this.data});

  Solid_Medicine_Model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataSolidMedicine>[];
      json['data'].forEach((v) {
        data!.add(new DataSolidMedicine.fromJson(v));
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

class DataSolidMedicine {
  int? id;
  String? paymentId;
  int? patientId;
  int? medicineId;
  int? quantity;
  int? amount;
  String? createdAt;
  String? updatedAt;
  Medicine? medicine;

  DataSolidMedicine(
      {this.id,
      this.paymentId,
      this.patientId,
      this.medicineId,
      this.quantity,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.medicine});

  DataSolidMedicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentId = json['payment_id'];
    patientId = json['patient_id'];
    medicineId = json['medicine_id'];
    quantity = json['quantity'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    medicine = json['medicine'] != null
        ? new Medicine.fromJson(json['medicine'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['payment_id'] = this.paymentId;
    data['patient_id'] = this.patientId;
    data['medicine_id'] = this.medicineId;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.medicine != null) {
      data['medicine'] = this.medicine!.toJson();
    }
    return data;
  }
}

class Medicine {
  int? id;
  String? name;
  String? price;
  int? quantity;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;

  Medicine(
      {this.id,
      this.name,
      this.price,
      this.quantity,
      this.expiryDate,
      this.createdAt,
      this.updatedAt});

  Medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
