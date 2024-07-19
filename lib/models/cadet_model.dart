import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kohatian_foundation/widget_export.dart';

class Cadet extends Equatable {
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
  final String? profileImageUrl;
  final List<String>? photosOnFile;

  Cadet(
      this.kitNo,
      this.email,
      this.house,
      this.name,
      this.domicile,
      this.mobileNumber,
      this.socialLinks,
      this.professionalQualifications,
      this.achievements,
      this.profileImageUrl,
      this.photosOnFile);

  Cadet.empty()
      : kitNo = 'created empty',
        email = null,
        house = 'created empty',
        name = 'created empty',
        domicile = 'created empty',
        mobileNumber = 'created empty',
        socialLinks = null,
        professionalQualifications = null,
        achievements = null,
        profileImageUrl = null,
        photosOnFile = null;

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
    String? profileImageUrl,
    List<String>? photosOnFile,
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
      profileImageUrl ?? this.profileImageUrl,
      photosOnFile ?? this.photosOnFile,
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
    if (profileImageUrl != null) {
      result.addAll({'profileImageUrl': profileImageUrl});
    }
    if (photosOnFile != null) {
      result.addAll({'photosOnFile': photosOnFile});
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
      map['profileImageUrl'],
      map['photosOnFile'] != null
          ? List<String>.from(map['photosOnFile'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cadet.fromJson(String source) => Cadet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cadet(kitNo: $kitNo, email: $email, house: $house, name: $name, domicile: $domicile, mobileNumber: $mobileNumber, socialLinks: $socialLinks, professionalQualifications: $professionalQualifications, achievements: $achievements, profileImageUrl: $profileImageUrl, photosOnFile: $photosOnFile)';
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
        listEquals(other.achievements, achievements) &&
        other.profileImageUrl == profileImageUrl &&
        listEquals(other.photosOnFile, photosOnFile);
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
        achievements.hashCode ^
        profileImageUrl.hashCode ^
        photosOnFile.hashCode;
  }

  @override
  List<Object?> get props => [
        kitNo,
        email,
        house,
        name,
        domicile,
        mobileNumber,
        socialLinks,
        professionalQualifications,
        achievements,
        profileImageUrl,
        photosOnFile
      ];
}
