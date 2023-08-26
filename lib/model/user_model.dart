class User {
  int? id;
  final String email;
  final String username;
  final String password;

  User(
      {this.id,
      required this.email,
      required this.username,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}
