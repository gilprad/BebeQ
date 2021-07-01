import 'dart:convert';

List<GejalaModel> gejalaModelFromJson(List str) => List<GejalaModel>.from(str.map((x) => GejalaModel.fromJson(x)));

String gejalaModelToJson(List<GejalaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GejalaModel {
    GejalaModel({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;

    factory GejalaModel.fromJson(Map<String, dynamic> json) => GejalaModel(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
