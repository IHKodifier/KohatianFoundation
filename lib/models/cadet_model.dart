import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kohatian_foundation/widget_export.dart';

///adding the functionality for listing [Qualification],[Achievements],profile Editing etc.

class Cadet {
  final int kitNo;
  final bool hasSignedUp;
  final String? email;
  final String house;
  final String name;
  final String domicile;
  final String mobileNumber;
  SocialLink socialLinks;
  final List<Qualification>? professionalQualifications;
  final List<Achievements>? achievements;
  final String? profileImageUrl;
  final List<String>? photosOnFile;
  final String? bannerImageUrl; // Added bannerImageUrl

  Cadet({
    required this.kitNo,
    required this.house,
    required this.name,
    required this.domicile,
    required this.mobileNumber,
    this.email,
    SocialLink? socialLinks,
        
    this.hasSignedUp = false, // Default value for hasSignedUp
    this.bannerImageUrl, // Added bannerImageUrl to constructor
    this.professionalQualifications,
    this.achievements,
    this.profileImageUrl,
    this.photosOnFile,
  }) : socialLinks = socialLinks ??
            SocialLink(
              // Initialize with empty SocialLink if not provided
              facebook: '',
              instagram: '',
              twitter: '',
              youtube: '',
              linkedin: '',
              whatsapp:
                  '', // These should not be nullable according to your SocialLink model
              email:
                  '', // These should not be nullable according to your SocialLink model
            );

Cadet.empty({
    required int kitNo,
  })  : kitNo = kitNo,
        hasSignedUp = false,
        email = null,
        house = '...awaiting signup...',
        name = '...awaiting signup...',
        domicile = '...awaiting signup...',
        mobileNumber = '...awaiting signup...',
        socialLinks =  SocialLink(
            facebook: '',
            instagram: '',
            twitter: '',
            youtube: '',
            linkedin: '',
            whatsapp: '',
            email: ''),
        professionalQualifications = null,
        achievements = null,
        profileImageUrl = '',
        photosOnFile = null,
        bannerImageUrl = null; // Added bannerImageUrl to named constructor


  Cadet copyWith({
    int? kitNo,
    String? email,
    String? house,
    String? name,
    String? domicile,
    String? mobileNumber,
    SocialLink? socialLinks,
    List<Qualification>? professionalQualifications,
    List<Achievements>? achievements,
    String? profileImageUrl,
    List<String>? photosOnFile,
    bool? hasSignedUp,
    String? bannerImageUrl, // Added bannerImageUrl to copyWith
  }) {
    return Cadet(
      kitNo: kitNo ?? this.kitNo,
      email: email ?? this.email,
      house: house ?? this.house,
      name: name ?? this.name,
      domicile: domicile ?? this.domicile,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      socialLinks: socialLinks ?? this.socialLinks,
      professionalQualifications:
          professionalQualifications ?? this.professionalQualifications,
      achievements: achievements ?? this.achievements,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      photosOnFile: photosOnFile ?? this.photosOnFile,
      hasSignedUp: hasSignedUp ?? this.hasSignedUp,
      bannerImageUrl: bannerImageUrl ??
          this.bannerImageUrl, // Added bannerImageUrl to copyWith
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'kitNo': kitNo}); 
    if (email != null) {
      result.addAll({'email': email});
    }
    result.addAll({'house': house});
    result.addAll({'hasSignedUp': hasSignedUp}); // No conversion needed
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
    if (bannerImageUrl != null) {
      // Added bannerImageUrl to toMap
      result.addAll({'bannerImageUrl': bannerImageUrl});
    }

    return result;
  }
factory Cadet.fromMap(Map<String, dynamic> map) {
    return Cadet(
      kitNo: map['kitNo'] ?? '0', // Convert String to int
      hasSignedUp: map['hasSignedUp'] ?? false,
      email: map['email'],
      house: map['house'] ?? '',
      name: map['name'] ?? '',
      domicile: map['domicile'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',

      socialLinks: map['socialLinks'] != null
          ? SocialLink.fromMap(map['socialLinks'])
          : null,

    



      professionalQualifications: map['professionalQualifications'] != null
          ? List<Qualification>.from(map['professionalQualifications']
              ?.map((x) => Qualification.fromMap(x)))
          : null,
      achievements: map['achievements'] != null
          ? List<Achievements>.from(
              map['achievements']?.map((x) => Achievements.fromMap(x)))
          : null,
      profileImageUrl: map['profileImageUrl'],
      photosOnFile: map['photosOnFile'] != null
          ? List<String>.from(map['photosOnFile'])
          : null,
      bannerImageUrl: map['bannerImageUrl'], // Added bannerImageUrl to fromMap
    );
  }

  String toJson() => json.encode(toMap());

  factory Cadet.fromJson(String source) => Cadet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cadet(kitNo: $kitNo, email: $email, house: $house, name: $name, domicile: $domicile, mobileNumber: $mobileNumber, socialLinks: $socialLinks, professionalQualifications: $professionalQualifications, achievements: $achievements, profileImageUrl: $profileImageUrl, photosOnFile: $photosOnFile, bannerImageUrl: $bannerImageUrl)'; // Added bannerImageUrl to toString
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
        listEquals(other.photosOnFile, photosOnFile) &&
        other.bannerImageUrl ==
            bannerImageUrl; // Added banner ImageUrl to Equality check

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
        photosOnFile.hashCode ^
        bannerImageUrl.hashCode; // Added bannerImageUrl to hashCode

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
        photosOnFile,
        bannerImageUrl // Added bannerImageUrl to props

      ];
}
