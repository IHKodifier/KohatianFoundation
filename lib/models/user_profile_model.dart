import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kohatian_foundation/widget_export.dart';

class UserProfile {
  final String uuid;
  final String name;
  final String email;
  final String kitNo;
  final String house;
  final String domicile;
  final String mobileNumber;
  String? password;
  final bool isValidated;
  List<UserRole> roles;


  UserProfile({
    required this.uuid,
    required this.name,
    required this.email,
    required this.kitNo,
    required this.house,
    required this.domicile,
    required this.mobileNumber,
    this.password,
    required this.isValidated,
    required this.roles,
  });

  UserProfile copyWith({
    String? uuid,
    String? name,
    String? email,
    String? kitNo,
    String? house,
    String? domicile,
    String? mobileNumber,
    String? password,
    bool? isValidated=false,
    List<UserRole>? roles,
  }) {
    return UserProfile(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      email: email ?? this.email,
      kitNo: kitNo ?? this.kitNo,
      house: house ?? this.house,
      domicile: domicile ?? this.domicile,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      password: password ?? this.password,
      isValidated: isValidated ?? this.isValidated,
      roles: roles ?? this.roles,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'uuid': uuid});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'kitNo': kitNo});
    result.addAll({'house': house});
    result.addAll({'domicile': domicile});
    result.addAll({'mobileNumber': mobileNumber});
    if(password != null){
      result.addAll({'password': password});
    }
    result.addAll({'isValidated': isValidated});
    result.addAll({'roles': roles.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uuid: map['uuid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      kitNo: map['kitNo'] ?? '',
      house: map['house'] ?? '',
      domicile: map['domicile'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      password: map['password'],
      isValidated: map['isValidated'] ?? false,
      roles: List<UserRole>.from(map['roles']?.map((x) => UserRole.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(uuid: $uuid, name: $name, email: $email, kitNo: $kitNo, house: $house, domicile: $domicile, mobileNumber: $mobileNumber, password: $password, isValidated: $isValidated, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserProfile &&
      other.uuid == uuid &&
      other.name == name &&
      other.email == email &&
      other.kitNo == kitNo &&
      other.house == house &&
      other.domicile == domicile &&
      other.mobileNumber == mobileNumber &&
      other.password == password &&
      other.isValidated == isValidated &&
      listEquals(other.roles, roles);
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
      name.hashCode ^
      email.hashCode ^
      kitNo.hashCode ^
      house.hashCode ^
      domicile.hashCode ^
      mobileNumber.hashCode ^
      password.hashCode ^
      isValidated.hashCode ^
      roles.hashCode;
  }
}
