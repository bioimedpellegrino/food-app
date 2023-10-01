import 'dart:convert';

List<AdviceModel> adviceModelFromJson(String str) =>
    List<AdviceModel>.from(json.decode(str).map((x) => AdviceModel.fromJson(x)));
class AdviceModel{
  
  AdviceModel({
    this.title,
    this.desc,
    this.image,
    this.type,
    this.time
  });

  String? image,title,desc,time, type;
  bool? isFav=false;

  factory AdviceModel.fromJson(Map<String, dynamic> json) => AdviceModel(
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