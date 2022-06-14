class User_Details{
   String? name;
String? address;

  User_Details({required this.name,required this.address});

  Map<String , dynamic> getjson(){
    return {
      "name":name,
      "address":address
    };
  }

  User_Details.fromjson(Map<String, dynamic> json){
    name=json["name"];
    address=json["address"];
  }
}