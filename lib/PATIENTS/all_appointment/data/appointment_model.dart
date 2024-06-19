class patient_info_model {
  bool? success;
  String? message;
  List<DataApp>? data;

  patient_info_model({this.success, this.message, this.data});

  patient_info_model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataApp>[];
      json['data'].forEach((v) {
        data!.add(new DataApp.fromJson(v));
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

class DataApp {
  int? id;
  int? patientId;
  int? doctorId;
  String? date;
  String? time;
  String? reason;
  String? status;
  int? paid;
  String? price;
  String? createdAt;
  String? updatedAt;
  Doctor? doctor;

  DataApp(
      {this.id,
      this.patientId,
      this.doctorId,
      this.date,
      this.time,
      this.reason,
      this.status,
      this.paid,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.doctor});

  DataApp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    date = json['date'];
    time = json['time'];
    reason = json['reason'];
    status = json['status'];
    paid = json['paid'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['doctor_id'] = this.doctorId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['paid'] = this.paid;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    return data;
  }
}

class Doctor {
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

  Doctor(
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

  Doctor.fromJson(Map<String, dynamic> json) {
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
