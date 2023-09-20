// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDataSchema {
  final String email;
  final int healthScore;
  final List<Map<dynamic, dynamic>> totalTask;
  final int streak;
  final int prizeMoney;
  final String name;
  UserDataSchema({
    required this.email,
    required this.healthScore,
    required this.totalTask,
    required this.streak,
    required this.prizeMoney,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'healthScore': healthScore,
      'totalTask': totalTask,
      'streak': streak,
      'prizeMoney': prizeMoney,
      'name': name,
    };
  }

  factory UserDataSchema.fromMap(Map<String, dynamic> map) {
    return UserDataSchema(
      email: map['email'] as String,
      healthScore: map['healthScore'] as int,
      totalTask: List<Map<dynamic, dynamic>>.from(
        (map['totalTask'] as List<dynamic>).map<Map<dynamic, dynamic>>(
          (x) => x as Map<dynamic, dynamic>,
        ),
      ),
      streak: map['streak'] as int,
      prizeMoney: map['prizeMoney'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataSchema.fromJson(String source) =>
      UserDataSchema.fromMap(json.decode(source) as Map<String, dynamic>);
}