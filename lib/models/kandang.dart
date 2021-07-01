// To parse this JSON data, do
//
//     final kandangModel = kandangModelFromJson(jsonString);

import 'dart:convert';

List<KandangModel> kandangModelFromJson(List str) => List<KandangModel>.from(str.map((x) => KandangModel.fromJson(x)));

String kandangModelToJson(List<KandangModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KandangModel {
    KandangModel({
        this.id,
        this.userId,
        this.categoryId,
        this.name,
        this.currentCapacity,
        this.capacity,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.user,
        this.history,
    });

    int id;
    int userId;
    int categoryId;
    String name;
    int currentCapacity;
    int capacity;
    int active;
    DateTime createdAt;
    DateTime updatedAt;
    Category category;
    User user;
    List<History> history;

    factory KandangModel.fromJson(Map<String, dynamic> json) => KandangModel(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        name: json["name"],
        currentCapacity: json["current_capacity"],
        capacity: json["capacity"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: Category.fromJson(json["category"]),
        user: User.fromJson(json["user"]),
        history: List<History>.from(json["history"].map((x) => History.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "name": name,
        "current_capacity": currentCapacity,
        "capacity": capacity,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category.toJson(),
        "user": user.toJson(),
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.berat,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    int berat;
    DateTime createdAt;
    DateTime updatedAt;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        berat: json["berat"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "berat": berat,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class History {
    History({
        this.id,
        this.cageId,
        this.num,
        this.value,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int cageId;
    int num;
    String value;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        cageId: json["cage_id"],
        num: json["num"],
        value: json["value"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cage_id": cageId,
        "num": num,
        "value": value,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class User {
    User({
        this.id,
        this.role,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String role;
    String name;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        role: json["role"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
