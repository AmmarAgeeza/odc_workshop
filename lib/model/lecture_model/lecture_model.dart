class LectureModel {
  String? code;
  String? message;
  List<LectureData>? data;

  LectureModel({this.code, this.message, this.data});

  LectureModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LectureData>[];
      json['data'].forEach((v) {
        data!.add(new LectureData.fromJson(v));
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

class LectureData {
  int? id;
  String? lectureSubject;
  String? lectureDate;
  String? lectureStartTime;
  String? lectureEndTime;

  LectureData(
      {this.id,
        this.lectureSubject,
        this.lectureDate,
        this.lectureStartTime,
        this.lectureEndTime});

  LectureData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lectureSubject = json['lectureSubject'];
    lectureDate = json['lectureDate'];
    lectureStartTime = json['lectureStartTime'];
    lectureEndTime = json['lectureEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lectureSubject'] = this.lectureSubject;
    data['lectureDate'] = this.lectureDate;
    data['lectureStartTime'] = this.lectureStartTime;
    data['lectureEndTime'] = this.lectureEndTime;
    return data;
  }
}