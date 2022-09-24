class SectionModel {
  String? code;
  String? message;
  List<SectionData>? data;

  SectionModel({this.code, this.message, this.data});

  SectionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SectionData>[];
      json['data'].forEach((v) {
        data!.add(new SectionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SectionData {
  int? id;
  String? sectionSubject;
  String? sectionDate;
  String? sectionStartTime;
  String? sectionEndTime;

  SectionData(
      {this.id,
        this.sectionSubject,
        this.sectionDate,
        this.sectionStartTime,
        this.sectionEndTime});

  SectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionSubject = json['sectionSubject'];
    sectionDate = json['sectionDate'];
    sectionStartTime = json['sectionStartTime'];
    sectionEndTime = json['sectionEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sectionSubject'] = this.sectionSubject;
    data['sectionDate'] = this.sectionDate;
    data['sectionStartTime'] = this.sectionStartTime;
    data['sectionEndTime'] = this.sectionEndTime;
    return data;
  }
}