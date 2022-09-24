class ExamModel {
  String? code;
  String? message;
  List<ExamData>? data;

  ExamModel({this.code, this.message, this.data});

  ExamModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ExamData>[];
      json['data'].forEach((v) { data!.add(new ExamData.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExamData {
  int? id;
  String? examSubject;
  String? examDate;
  String? examStartTime;
  String? examEndTime;
  bool? finalExam;

  ExamData({this.id, this.examSubject, this.examDate, this.examStartTime, this.examEndTime, this.finalExam});

  ExamData.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  examSubject = json['examSubject'];
  examDate = json['examDate'];
  examStartTime = json['examStartTime'];
  examEndTime = json['examEndTime'];
  finalExam = json['final'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = id;
  data['examSubject'] = examSubject;
  data['examDate'] = examDate;
  data['examStartTime'] = examStartTime;
  data['examEndTime'] = examEndTime;
  data['final'] = finalExam;
  return data;
  }
}