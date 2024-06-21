class Accounts_Model {
  bool? success;
  String? message;
  List<AccountsData>? data;

  Accounts_Model({this.success, this.message, this.data});

  Accounts_Model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AccountsData>[];
      json['data'].forEach((v) {
        data!.add(new AccountsData.fromJson(v));
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

class AccountsData {
  int? id;
  String? paymentId;
  int? patientId;
  int? medicineId;
  int? quantity;
  int? amount;
  String? createdAt;
  String? updatedAt;
  Patient? patient;
  Medicine? medicine;

  AccountsData(
      {this.id,
      this.paymentId,
      this.patientId,
      this.medicineId,
      this.quantity,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.patient,
      this.medicine});

  AccountsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentId = json['payment_id'];
    patientId = json['patient_id'];
    medicineId = json['medicine_id'];
    quantity = json['quantity'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    patient =
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
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
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    if (this.medicine != null) {
      data['medicine'] = this.medicine!.toJson();
    }
    return data;
  }
}

class Patient {
  int? id;
  int? roleId;
  String? firstName;
  String? lastName;
  String? email;
  Null? emailVerifiedAt;
  String? phone;
  String? birthDate;
  String? createdAt;
  String? updatedAt;

  Patient(
      {this.id,
      this.roleId,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.birthDate,
      this.createdAt,
      this.updatedAt});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    birthDate = json['birth_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['birth_date'] = this.birthDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
