import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kohatian_foundation/widget_export.dart';
import 'package:collection/collection.dart'; // Import collection package

///adding the functionality for listing [Qualification],[Achievement],profile Editing etc.

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
  final List<Achievement>? achievements;
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
    this.bannerImageUrl =
            'https://picsum.photos/800/150?random=2',
    this.professionalQualifications,
    this.achievements,
   this.profileImageUrl = 'https://picsum.photos/300/300?random =2',
    this.photosOnFile,
  }) : socialLinks = socialLinks ??
            SocialLink(
              // Initialize with empty SocialLink if not provided
              facebook: '',
              instagram: '',
              twitter: '',
              youtube: '',
              linkedin: '',
              whatsapp: '',
              email: '',
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
        socialLinks = SocialLink(
            facebook: '',
            instagram: '',
            twitter: '',
            youtube: '',
            linkedin: '',
            whatsapp: '',
            email: ''),
        professionalQualifications = [],
        achievements = [],
        profileImageUrl = 'https://picsum.photos/300/300?random =2',
        photosOnFile = [],
        bannerImageUrl =
            'https://picsum.photos/800/150?random=2';

  Cadet copyWith({
    int? kitNo,
    String? email,
    String? house,
    String? name,
    String? domicile,
    String? mobileNumber,
    SocialLink? socialLinks,
    List<Qualification>? professionalQualifications,
    List<Achievement>? achievements,
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
          : [], // Initialize as empty list if null
      achievements: map['achievements'] != null
          ? List<Achievement>.from(
              map['achievements']?.map((x) => Achievement.fromMap(x)))
          : [], // Initialize as empty list if null

      photosOnFile: map['photosOnFile'] != null
          ? List<String>.from(map['photosOnFile'])
          : [], // Initialize as empty list if null
      bannerImageUrl: map['bannerImageUrl'], // Added bannerImageUrl to fromMap
      profileImageUrl: map['profileImageUrl'],
    );
  }

  String toJson() => json.encode(toMap());
  factory Cadet.fromJson(String source) => Cadet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cadet(kitNo: $kitNo, email: $email, house: $house, name: $name, domicile: $domicile, mobileNumber: $mobileNumber, socialLinks: $socialLinks, professionalQualifications: $professionalQualifications, achievements: $achievements, profileImageUrl: $profileImageUrl, photosOnFile: $photosOnFile, bannerImageUrl: $bannerImageUrl)'; // Added bannerImageUrl to toString
  }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is Cadet &&
  //       other.kitNo == kitNo &&
  //       other.email == email &&
  //       other.house == house &&
  //       other.name == name &&
  //       other.domicile == domicile &&
  //       other.mobileNumber == mobileNumber &&
  //       other.socialLinks == socialLinks &&
  //       listEquals(
  //           other.professionalQualifications, professionalQualifications) &&
  //       listEquals(other.achievements, achievements) &&
  //       other.profileImageUrl == profileImageUrl &&
  //       listEquals(other.photosOnFile, photosOnFile) &&
  //       other.bannerImageUrl ==
  //           bannerImageUrl; // Added banner ImageUrl to Equality check
  // }

  // @override
  // int get hashCode {
  //   return kitNo.hashCode ^
  //       email.hashCode ^
  //       house.hashCode ^
  //       name.hashCode ^
  //       domicile.hashCode ^
  //       mobileNumber.hashCode ^
  //       socialLinks.hashCode ^
  //       professionalQualifications.hashCode ^
  //       achievements.hashCode ^
  //       profileImageUrl.hashCode ^
  //       photosOnFile.hashCode ^
  //       bannerImageUrl.hashCode; // Added bannerImageUrl to hashCode
  // }

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
  bool isEqualDeeply(Cadet other) {
    return const DeepCollectionEquality().equals(
            professionalQualifications, other.professionalQualifications) &&
        const DeepCollectionEquality().equals(achievements, other.achievements);
    // ... other deep equality checks ...;
  }
}
