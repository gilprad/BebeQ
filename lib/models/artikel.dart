import 'dart:convert';

List<ArtikelModel> artikelModelFromJson(List str) => List<ArtikelModel>.from(str.map((x) => ArtikelModel.fromJson(x)));

String artikelModelToJson(List<ArtikelModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtikelModel {
    ArtikelModel({
        this.id,
        this.userId,
        this.title,
        this.value,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int userId;
    String title;
    String value;
    DateTime createdAt;
    DateTime updatedAt;

    factory ArtikelModel.fromJson(Map<String, dynamic> json) => ArtikelModel(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        value: json["value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "value": value,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
