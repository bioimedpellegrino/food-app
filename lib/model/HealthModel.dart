import 'dart:convert';

List<HealthModel> adviceModelFromJson(String str) =>
    List<HealthModel>.from(json.decode(str).map((x) => HealthModel.fromJson(x)));
class HealthModel{
  
  HealthModel({
    this.title,
    this.desc,
    this.image,
    this.type,
    this.time
  });

  String? image,title,desc,time, type;
  bool? isFav=false;

  factory HealthModel.fromJson(Map<String, dynamic> json) => HealthModel(
        title: json["title"],
        desc: json["description"],
        image: json["image"],
        type: json["type"],
        time: json["time"]
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": desc,
        "image": image,
        "type": type,
        "time": time
      };
}