
class UserModel{
  late String code;
  late String message;
  late Data data;

  UserModel.fromJson(Map<String,dynamic>json){
    code= json['code'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

}

class Data{
  late String token;
  Data.fromJson(Map<String,dynamic>json){
    token = json['accessToken'];
  }

}
