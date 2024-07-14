import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kohatian_foundation/widget_export.dart';


class AppUser {
  final String uuid;
  final String name;
  final String email;
  String? password;
  final bool isValidated;
  List<UserRole> roles;
  AppUser({
    required this.uuid,
    required this.name,
    required this.email,
    this.password,
    required this.isValidated,
    required this.roles,
  });

  AppUser copyWith({
    String? uuid,
    String? name,
    String? email,
    String? password,
    bool? isValidated,
    List<UserRole>? roles,
  }) {
    return AppUser(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      email: email ?? this.email,
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
    if (password != null) {
      result.addAll({'password': password});
    }
    result.addAll({'isValidated': isValidated});
    result.addAll({'roles': roles.map((x) => x.toMap()).toList()});

    return result;
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uuid: map['uuid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'],
      isValidated: map['isValidated'] ?? false,
      roles: List<UserRole>.from(map['roles']?.map((x) => UserRole.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(uuid: $uuid, name: $name, email: $email, password: $password, isValidated: $isValidated, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.uuid == uuid &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.isValidated == isValidated &&
        listEquals(other.roles, roles);
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        isValidated.hashCode ^
        roles.hashCode;
  }
}
