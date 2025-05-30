class AuthSuccessModel {
  final String accessToken;
  final String tokenType;
  final String identifier;

  AuthSuccessModel({
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
}
