import 'dart:convert';

List<PortionModel> portionModelFromJson(String str) =>
    List<PortionModel>.from(json.decode(str).map((x) => PortionModel.fromJson(x)));
class PortionModel{
  
  PortionModel({
    this.id,
    this.name,
    this.unity,
    this.quantity
  });

  int? id;
  String? name, unity;
  double? quantity;

  factory PortionModel.fromJson(Map<String, dynamic> json) => PortionModel(
        id: json["id"],
        name: json["name"],
        unity: json["unity"],
        quantity: json["quantity"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "unity": unity,
        "quantity": quantity
      };

  String toDietString() {
    return "$quantity $unity - $name";
  }
}