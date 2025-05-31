// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

@immutable
class AuthSuccessModel {
  final String accessToken;
  final String tokenType;
  final String identifier;

  const AuthSuccessModel({
    required this.accessToken,
    required this.tokenType,
    required this.identifier,
  });

  factory AuthSuccessModel.fromJson(Map<String, dynamic> json) {
    return AuthSuccessModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      identifier: json['identifier'],
    );
  }

  @override
  bool operator ==(covariant AuthSuccessModel other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.tokenType == tokenType &&
        other.identifier == identifier;
  }

  @override
  int get hashCode =>
      accessToken.hashCode ^ tokenType.hashCode ^ identifier.hashCode;
}
