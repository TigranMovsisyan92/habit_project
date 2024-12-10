import 'dart:convert';

class HabitModel {
  int? id;
  String? name;
  String? motivation;
  String? type;
  String? coment;
  DateTime? startDate;
  String? emoji;
  String? emojiName;
  List<String>? notifications;
  List<HabitComponents>? components;

  HabitModel({
    this.id,
    this.name,
    this.motivation,
    this.type,
    this.coment,
    this.startDate,
    this.emoji,
    this.emojiName,
    this.notifications,
    this.components,
  });

  HabitModel copyWith({
    int? id,
    String? name,
    String? motivation,
    String? type,
    String? coment,
    DateTime? startDate,
    String? emoji,
    String? emojiName,
    List<String>? notifications,
    List<HabitComponents>? components,
  }) {
    return HabitModel(
      id: id ?? this.id,
      name: name ?? this.name,
      motivation: motivation ?? this.motivation,
      type: type ?? this.type,
      coment: coment ?? this.coment,
      startDate: startDate ?? this.startDate,
      emoji: emoji ?? this.emoji,
      emojiName: emojiName ?? this.emojiName,
      notifications: notifications ?? this.notifications,
      components: components ?? this.components,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'motivation': motivation,
      'type': type,
      'coment': coment,
      'startDate': startDate?.millisecondsSinceEpoch,
      'emoji': emoji,
      'emojiName': emojiName,
      'notifications': json.encode(notifications),
      'components': json.encode(components?.map((x) => x.toMap()).toList()),
    };
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      motivation: map['motivation'] != null ? map['motivation'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      coment: map['coment'] != null ? map['coment'] as String : null,
      startDate: map['startDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int) : null,
      emoji: map['emoji'] != null ? map['emoji'] as String : null,
      emojiName: map['emojiName'] != null ? map['emojiName'] as String : null,
      notifications: map['notifications'] != null ? List<String>.from(json.decode(map['notifications'])) : null,
      components: map['components'] != null
          ? List<HabitComponents>.from((json.decode(map['components']) as List<dynamic>)
              .map((x) => HabitComponents.fromMap(x as Map<String, dynamic>)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitModel.fromJson(String source) =>
      HabitModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class HabitComponents {
  int? id;
  int? parentId;
  int? clicks;
  String? date;

  HabitComponents({
    this.id,
    this.parentId,
    this.clicks,
    this.date,
  });

  HabitComponents copyWith({
    int? id,
    int? parentId,
    int? clicks,
    String? date,
  }) {
    return HabitComponents(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      clicks: clicks ?? this.clicks,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'parentId': parentId,
      'clicks': clicks,
      'date': date,
    };
  }

  factory HabitComponents.fromMap(Map<String, dynamic> map) {
    return HabitComponents(
      id: map['id'] != null ? map['id'] as int : null,
      parentId: map['parentId'] != null ? map['parentId'] as int : null,
      clicks: map['clicks'] != null ? map['clicks'] as int : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitComponents.fromJson(String source) =>
      HabitComponents.fromMap(json.decode(source) as Map<String, dynamic>);
}
