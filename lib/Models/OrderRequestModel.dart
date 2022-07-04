class OrderRequestModel{
  final String name;
  final String address;

  OrderRequestModel({required this.name,required this.address});

  Map<String,dynamic> getJson(OrderRequestModel order){
    return {
      "name":order.name,
      "address":order.address
    };
  }

  factory OrderRequestModel.fromJson(Map<String,dynamic> json){
    return OrderRequestModel(name: json["name"], address: json["address"]);
  }
}