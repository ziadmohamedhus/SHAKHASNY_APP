class Add_doctor_model {
  bool? success;
  String? message;
  Data? data;

  Add_doctor_model({this.success, this.message, this.data});

  Add_doctor_model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? first_name;
  String? last_name;
  String? email;
  String? phone;
  String? birth_date;
  String? specialization;
  String? department_id;
  //String? password;
  String? createdAt;
  int? id;

  Data(
      {this.first_name,
        this.last_name,
        this.email,
        this.phone,
        this.birth_date,
        this.specialization,
        this.department_id,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    birth_date = json['birth_date'];
    specialization = json['specialization'];
    department_id = json['department_id'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['birth_date'] = this.birth_date;
    data['specialization'] = this.specialization;
    data['department_id'] = this.department_id;

    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
