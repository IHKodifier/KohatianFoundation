import 'dart:convert';



class Qualification {
  final String title;
  final String institution;
  final String year;

  Qualification({
    required this.title,
    required this.institution,
    required this.year,
  });

  Qualification copyWith({
    String? title,
    String? institution,
    String? year,
  }) {
    return Qualification(
      title: title ?? this.title,
      institution: institution ?? this.institution,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'institution': institution});
    result.addAll({'year': year});
  
    return result;
  }

  factory Qualification.fromMap(Map<String, dynamic> map) {
    return Qualification(
      title: map['title'] ?? '',
      institution: map['institution'] ?? '',
      year: map['year'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Qualification.fromJson(String source) => Qualification.fromMap(json.decode(source));

  @override
  String toString() => 'Qualification(title: $title, institution: $institution, year: $year)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Qualification &&
      other.title == title &&
      other.institution == institution &&
      other.year == year;
  }

  @override
  int get hashCode => title.hashCode ^ institution.hashCode ^ year.hashCode;
}
