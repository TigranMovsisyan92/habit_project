import 'dart:convert';

class PlanModel {
  final int? id;
  final String? name;
  final String? emoji;
  final String? emojiName;

  PlanModel({
    this.id,
    this.name,
    this.emoji,
    this.emojiName,
  });

  PlanModel copyWith({
    int? id,
    String? name,
    String? emoji,
    String? emojiName,
  }) {
    return PlanModel(
      id: id ?? this.id,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      emojiName: emojiName ?? this.emojiName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'emoji': emoji,
      'emojiName': emojiName,
    };
  }

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      emoji: map['emoji'] != null ? map['emoji'] as String : null,
      emojiName: map['emojiName'] != null ? map['emojiName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanModel.fromJson(String source) => PlanModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
