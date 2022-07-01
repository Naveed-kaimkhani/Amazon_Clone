class ReviewModel{
  final String senderName;
  final String description;
  final int rating;

  ReviewModel({ required this.senderName,required this.description,required this.rating});

  factory ReviewModel.fromJson(Map<String , dynamic> json){
    return ReviewModel(senderName: json['senderName'],
     description: json['description'], 
     rating: json['rating']);
  }

  Map<String,dynamic> getjson(){
    return {
      'senderName':senderName,
      'description':description,
      'ratring':rating, 
    };
  }
}