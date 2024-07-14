import 'dart:convert';

class Achievements {
  final String title;
  final String year;
  final String description;
  final String conferringbody;

  Achievements(
    this.title,
    this.year,
    this.description,
    this.conferringbody,
  );

  Achievements copyWith({
    String? title,
    String? year,
    String? description,
    String? conferringbody,
  }) {
    return Achievements(
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

  factory Achievements.fromMap(Map<String, dynamic> map) {
    return Achievements(
      map['title'] ?? '',
      map['year'] ?? '',
      map['description'] ?? '',
      map['conferringbody'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Achievements.fromJson(String source) =>
      Achievements.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Achievements(title: $title, year: $year, description: $description, conferringbody: $conferringbody)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Achievements &&
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
