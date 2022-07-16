

class categories{
  final String name;
  final String? pic1;
  final String? pic2;
  categories({required this.name,required this.pic1, required this.pic2});
  factory categories.fromJson(Map<String, dynamic> json){
    return categories(
        name : json["name"],
        pic1: json["backgroundImage"],
        pic2: json["foregroundImage"]
    );

  }Map<String, dynamic> toJson() => {
    'pic2' : pic2,
    'pic1': pic1,
    'name': name,
  };
}