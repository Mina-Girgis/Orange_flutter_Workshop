class FAQModel {
  String? code;
  String? message;
  List<Data>? data;
  FAQModel({this.code, this.message, this.data});

  FAQModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }


}

class Data {
  String? question;
  String? answer;
  bool show = false;
  Data({this.question, this.answer});

  Data.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }

  void changeShow(){
    show=!show;
  }
}
