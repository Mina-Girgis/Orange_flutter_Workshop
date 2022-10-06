class FinalModel {
  String? code;
  String? message;
  List<Data>? data;

  FinalModel({this.code, this.message, this.data});

  FinalModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) { data!.add(new Data.fromJson(v)); });
    }
  }

}

class Data {
  int? id;
  String? examSubject;
  String? examDate;
  String? examStartTime;
  String? examEndTime;
  bool? finall ;

  Data({this.id, this.examSubject, this.examDate, this.examStartTime, this.examEndTime, this.finall});

  Data.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  examSubject = json['examSubject'];
  examDate = json['examDate'];
  examStartTime = json['examStartTime'];
  examEndTime = json['examEndTime'];
  finall = json['final'];
  }

}
