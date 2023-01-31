class User {
  final String email;
  final String password;
  final String gender;

  User({
    required this.email,
    required this.password,
    required this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password, "gender": gender};
  }
}
