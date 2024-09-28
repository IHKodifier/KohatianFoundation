import 'dart:convert';

class Achievement {
  final String title;
  final String year;
  final String description;
  final String conferringbody;

  Achievement(
    this.title,
    this.year,
    this.description,
    this.conferringbody,
  );

  Achievement copyWith({
    String? title,
    String? year,
    String? description,
    String? conferringbody,
  }) {
    return Achievement(
      title ?? this.title,
      year ?? this.year,
      description ?? this.description,
      conferringbody ?? this.conferringbody,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'year': year});
    result.addAll({'description': description});
    result.addAll({'conferringbody': conferringbody});

    return result;
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      map['title'] ?? '',
      map['year'] ?? '',
      map['description'] ?? '',
      map['conferringbody'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Achievement.fromJson(String source) =>
      Achievement.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Achievements(title: $title, year: $year, description: $description, conferringbody: $conferringbody)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Achievement &&
        other.title == title &&
        other.year == year &&
        other.description == description &&
        other.conferringbody == conferringbody;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        year.hashCode ^
        description.hashCode ^
        conferringbody.hashCode;
  }
}
