class GradeModel{
  late String grade;

  GradeModel.fromJson(Map<String,dynamic>json){
    grade = json['grade'];
  }

}