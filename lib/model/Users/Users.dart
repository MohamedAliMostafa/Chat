
class UsersModel
{
  static const String Collection="Users";
  String id;
  String fName;
  String age;
  String email ;

  UsersModel({required this.id, required this.fName, required this.age, required this.email});

  static UsersModel FromJson(Map<String , dynamic >jos) {

    UsersModel userModel=UsersModel(id:jos["id"],fName: jos["fName"], age: jos["age"], email: jos["email"]);
    return userModel;
  }
  Map<String, dynamic>toJosn()
  {
    return
        {
          "id":id,"fName":fName, "age":age,"email":email
        };
  }

}