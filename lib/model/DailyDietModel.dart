import 'package:flutter_diet_tips/model/PortionModel.dart';

DailyDietModel dailyDietFromJson(Map<String, dynamic> json) {
    DailyDietModel dailyDiet = DailyDietModel.fromJson(json);
    return dailyDiet;
}

List<DailyDietModel> dailyDietListFromJson(List<dynamic> list) =>
  List<DailyDietModel>.from(list.map((x) => DailyDietModel.fromJson(x)));

class DailyDietModel{
  
  DailyDietModel({
    required this.id,
    required this.name,
    required this.category,
    required this.total_kcal,
    required this.total_carbohydrates,
    required this.total_proteins,
    required this.total_fats,
    this.portions
  });

  DailyDietModel.empty()
      : id = 0,
        name = '',
        category = '',
        total_kcal = 0.0,
        total_carbohydrates = 0.0,
        total_proteins = 0.0,
        total_fats = 0.0,
        portions = null;

  int id;
  String name, category;
  double total_kcal, total_carbohydrates, total_proteins, total_fats;
  List<PortionModel>? portions;


  factory DailyDietModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? jsonPortions = json['portions'];
    List<PortionModel>? portions;

    if (jsonPortions != null) {
      portions = jsonPortions
          .map((portion) => PortionModel.fromJson(portion))
          .toList();
    }

    return DailyDietModel(
      id: json["id"],
      name: json["name"],
      category: json["category"],
      total_kcal: json["total_kcal"]?.toDouble(),
      total_carbohydrates: json["total_carbohydrates"]?.toDouble(),
      total_proteins: json["total_proteins"]?.toDouble(),
      total_fats: json["total_fats"]?.toDouble(),
      portions: portions,
    );
  }
  
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? portionsJson;

    if (portions != null) {
      portionsJson = portions!.map((portion) => portion.toJson()).toList();
    }

    return {
      "id": id,
      "name": name,
      "category": category,
      "total_kcal": total_kcal,
      "total_carbohydrates": total_carbohydrates,
      "total_proteins": total_proteins,
      "total_fats": total_fats,
      "portions": portionsJson,
    };
  }

  void printInstance() {
    print("Name: " + name + " Category: " + category + " Total KCAL:" + total_kcal.toString());
  }
}