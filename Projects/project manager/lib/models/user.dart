import 'dart:convert';

class User {
  final String name;
  final String id;
  final String email;
  final String password;
  final String confirmPass;
  final String token;

  User(
      {required this.name,
      required this.email,
      required this.token,
      required this.password,
      required this.confirmPass,
      required this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'confirmPass': confirmPass,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        confirmPass: map['confirmPass'],
        token: map['token'],
        id: '_id');
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
