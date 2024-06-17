class All_Doctor_Model {
  bool? success;
  String? message;
  List<DataDoctor>? data;

  All_Doctor_Model({this.success, this.message, this.data});

  All_Doctor_Model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataDoctor>[];
      json['data'].forEach((v) {
        data!.add(new DataDoctor.fromJson(v));
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

class DataDoctor {
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
  Doctor? doctor;
  Image? image;
  List<WorkingHours>? workingHours;

  DataDoctor(
      {this.id,
      this.roleId,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.birthDate,
      this.createdAt,
      this.updatedAt,
      this.doctor,
      this.image,
      this.workingHours});

  DataDoctor.fromJson(Map<String, dynamic> json) {
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
    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    if (json['working_hours'] != null) {
      workingHours = <WorkingHours>[];
      json['working_hours'].forEach((v) {
        workingHours!.add(new WorkingHours.fromJson(v));
      });
    }
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
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.workingHours != null) {
      data['working_hours'] =
          this.workingHours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctor {
  int? id;
  int? userId;
  String? specialization;
  String? departmentId;
  String? fee;
  String? createdAt;
  String? updatedAt;

  Doctor(
      {this.id,
      this.userId,
      this.specialization,
      this.departmentId,
      this.fee,
      this.createdAt,
      this.updatedAt});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    specialization = json['specialization'];
    departmentId = json['department_id'];
    fee = json['fee'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['specialization'] = this.specialization;
    data['department_id'] = this.departmentId;
    data['fee'] = this.fee;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class WorkingHours {
  int? id;
  String? day;
  String? startDate;
  String? endDate;
  int? doctorId;
  String? createdAt;
  String? updatedAt;

  WorkingHours(
      {this.id,
      this.day,
      this.startDate,
      this.endDate,
      this.doctorId,
      this.createdAt,
      this.updatedAt});

  WorkingHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    doctorId = json['doctor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['doctor_id'] = this.doctorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
