import 'dart:convert';

class SocialLinks {
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String? youtube;
  final String? linkedin;
  final String whatsapp;
  final String email;

  SocialLinks({
    this.facebook = 'not available',
    this.instagram = 'not available',
    this.twitter = 'not available',
    this.youtube = 'not available',
    this.linkedin = 'not available',
    required this.whatsapp,
    required this.email,
  });

  SocialLinks copyWith({
    String? facebook,
    String? instagram,
    String? twitter,
    String? youtube,
    String? linkedin,
    String? whatsapp,
    String? email,
  }) {
    return SocialLinks(
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      twitter: twitter ?? this.twitter,
      youtube: youtube ?? this.youtube,
      linkedin: linkedin ?? this.linkedin,
      whatsapp: whatsapp ?? this.whatsapp,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (facebook != null) {
      result.addAll({'facebook': facebook});
    }
    if (instagram != null) {
      result.addAll({'instagram': instagram});
    }
    if (twitter != null) {
      result.addAll({'twitter': twitter});
    }
    if (youtube != null) {
      result.addAll({'youtube': youtube});
    }
    if (linkedin != null) {
      result.addAll({'linkedin': linkedin});
    }
    result.addAll({'whatsapp': whatsapp});
    result.addAll({'email': email});

    return result;
  }

  factory SocialLinks.fromMap(Map<String, dynamic> map) {
    return SocialLinks(
      facebook: map['facebook'],
      instagram: map['instagram'],
      twitter: map['twitter'],
      youtube: map['youtube'],
      linkedin: map['linkedin'],
      whatsapp: map['whatsapp'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialLinks.fromJson(String source) =>
      SocialLinks.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SocialLinks(facebook: $facebook, instagram: $instagram, twitter: $twitter, youtube: $youtube, linkedin: $linkedin, whatsapp: $whatsapp, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SocialLinks &&
        other.facebook == facebook &&
        other.instagram == instagram &&
        other.twitter == twitter &&
        other.youtube == youtube &&
        other.linkedin == linkedin &&
        other.whatsapp == whatsapp &&
        other.email == email;
  }

  @override
  int get hashCode {
    return facebook.hashCode ^
        instagram.hashCode ^
        twitter.hashCode ^
        youtube.hashCode ^
        linkedin.hashCode ^
        whatsapp.hashCode ^
        email.hashCode;
  }
}
