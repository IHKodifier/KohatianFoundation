import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserRole extends Equatable {
  final String value;

  UserRole._(this.value);

  factory UserRole.cadet() => UserRole._('cadet');
  factory UserRole.entryCoordinator() => UserRole._('entryCoordinator');
  factory UserRole.admin() => UserRole._('admin');

  Map<String, dynamic> toMap() {
    return {'value': value};
  }

  factory UserRole.fromMap(Map<String, dynamic> map) {
    return UserRole._(map['value']);
  }

  String toJson() => json.encode(toMap());

  factory UserRole.fromJson(String source) =>
      UserRole.fromMap(json.decode(source));

  @override
  String toString() => 'UserRole(value: $value)';

  @override
  List<Object?> get props => [value];
}
