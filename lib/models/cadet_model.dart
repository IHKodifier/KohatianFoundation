import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kohatian_foundation/models/social_links.dart';
import 'package:kohatian_foundation/services/widget_export.dart';

class Cadet {
  final String kitNo;
  final bool hasSignedUp = false;
  final String? email;
  final String house;
  final String name;
  final String domicile;
  final String mobileNumber;
  final SocialLinks? socialLinks;
  final List<Qualification>? professionalQualifications;
  final List<Achievements>? achievements;

  Cadet(
      this.kitNo,
      this.email,
      this.house,
      this.name,
      this.domicile,
      this.mobileNumber,
      this.socialLinks,
      this.professionalQualifications,
      this.achievements);

  Cadet copyWith({
    String? kitNo,
    String? email,
    String? house,
    String? name,
    String? domicile,
    String? mobileNumber,
    SocialLinks? socialLinks,
    List<Qualification>? professionalQualifications,
    List<Achievements>? achievements,
  }) {
    return Cadet(
      kitNo ?? this.kitNo,
      email ?? this.email,
      house ?? this.house,
      name ?? this.name,
      domicile ?? this.domicile,
      mobileNumber ?? this.mobileNumber,
      socialLinks ?? this.socialLinks,
      professionalQualifications ?? this.professionalQualifications,
      achievements ?? this.achievements,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'kitNo': kitNo});
    if (email != null) {
      result.addAll({'email': email});
    }
    result.addAll({'house': house});
    result.addAll({'name': name});
    result.addAll({'domicile': domicile});
    result.addAll({'mobileNumber': mobileNumber});
    if (socialLinks != null) {
      result.addAll({'socialLinks': socialLinks!.toMap()});
    }
    if (professionalQualifications != null) {
      result.addAll({
        'professionalQualifications':
            professionalQualifications!.map((x) => x.toMap()).toList()
      });
    }
    if (achievements != null) {
      result.addAll(
          {'achievements': achievements!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory Cadet.fromMap(Map<String, dynamic> map) {
    return Cadet(
      map['kitNo'] ?? '',
      map['email'],
      map['house'] ?? '',
      map['name'] ?? '',
      map['domicile'] ?? '',
      map['mobileNumber'] ?? '',
      map['socialLinks'] != null
          ? SocialLinks.fromMap(map['socialLinks'])
          : null,
      map['professionalQualifications'] != null
          ? List<Qualification>.from(map['professionalQualifications']
              ?.map((x) => Qualification.fromMap(x)))
          : null,
      map['achievements'] != null
          ? List<Achievements>.from(
              map['achievements']?.map((x) => Achievements.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cadet.fromJson(String source) => Cadet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cadet(kitNo: $kitNo, email: $email, house: $house, name: $name, domicile: $domicile, mobileNumber: $mobileNumber, socialLinks: $socialLinks, professionalQualifications: $professionalQualifications, achievements: $achievements)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cadet &&
        other.kitNo == kitNo &&
        other.email == email &&
        other.house == house &&
        other.name == name &&
        other.domicile == domicile &&
        other.mobileNumber == mobileNumber &&
        other.socialLinks == socialLinks &&
        listEquals(
            other.professionalQualifications, professionalQualifications) &&
        listEquals(other.achievements, achievements);
  }

  @override
  int get hashCode {
    return kitNo.hashCode ^
        email.hashCode ^
        house.hashCode ^
        name.hashCode ^
        domicile.hashCode ^
        mobileNumber.hashCode ^
        socialLinks.hashCode ^
        professionalQualifications.hashCode ^
        achievements.hashCode;
  }
}
