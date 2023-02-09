class User {
  final String email;
  final String password;
  final String gender;
  final String tokenAccess;
  final String tokenRefresh;
  final String userId;

  User(
      {required this.email,
      required this.password,
      required this.gender,
      required this.tokenAccess,
      required this.tokenRefresh,
      required this.userId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json["user"]['email'],
        password: json["user"]['password'],
        gender: json["user"]['gender'],
        tokenAccess: json['token']['access'],
        tokenRefresh: json['token']['refresh'],
        userId: json["user"]["user_id"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "gender": gender,
      "token_access": tokenAccess,
      "token_refresh": tokenRefresh,
      "userId": userId
    };
  }
}
