import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.username,
    required this.email,
    required this.phone,
    this.phone_prefix,
    this.gender,
    this.birth_date,
    this.height,
    this.weight
  });

  UserModel.empty()
      : id = 0,
        name = '',
        surname = '',
        username = '',
        email = '',
        phone = '',
        phone_prefix = '',
        gender = '',
        height = 0,
        weight = 0;

  int id;
  String name;
  String surname;
  String username;
  String email;
  String phone;
  String? phone_prefix;
  String? gender;
  String? birth_date;
  int? height;
  double? weight; 

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        phone_prefix: json["phone_prefix"],
        gender: json["gender"],
        birth_date: json["birth_date"],
        height: json["height"],
        weight: json["weight"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "username": username,
        "email": email,
        "phone": phone,
        "phone_prefix": phone_prefix,
        "gender": gender,
        "birth_date": birth_date,
        "height": height,
        "weight": weight,
      };
}