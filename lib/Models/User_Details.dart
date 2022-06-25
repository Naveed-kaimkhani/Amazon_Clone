class User_Details{
   String? name;
String? phone;

  User_Details({required this.name,required this.phone});

  Map<String , dynamic> getjson(){
    return {
      "name":name,
      "phone":phone,
    };
  }

  User_Details.fromjson(Map<String, dynamic> json){
    name=json["name"];
    phone=json["phone"];
  }

  factory User_Details.getModelFromJson(Map<String,dynamic> json){
    return User_Details(name: json["name"], phone: json["phone"]);
  }
}