
class UniversityModel{
  late int id;
  late String name;

  UniversityModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
  }

}