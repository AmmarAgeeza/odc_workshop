class RegisterModel {
  String? code;
  String? message;
  Data? data;

  RegisterModel({this.code, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? email;
  String? password;
  String? name;
  String? gender;
  String? phoneNumber;
  int? universityId;
  int? gradeId;
  int? roleId;

  Data(
      {this.email,
        this.password,
        this.name,
        this.gender,
        this.phoneNumber,
        this.universityId,
        this.gradeId,
        this.roleId});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    universityId = json['universityId'];
    gradeId = json['gradeId'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    data['universityId'] = this.universityId;
    data['gradeId'] = this.gradeId;
    data['roleId'] = this.roleId;
    return data;
  }
}