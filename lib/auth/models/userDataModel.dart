class UserDataModel{
  String? id;
  String? email;
  String? name;
  UserDataModel({this.id = "", this.email, this.name});
    UserDataModel.fromJson(Map<String, dynamic> json): this(
    id: json["id"],
    name: json["name"],
    email: json["email"]
  );

  Map<String, dynamic> toJson()=>{
    "id": id,
    "name": name,
    "email": email
  };
}