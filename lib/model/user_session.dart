import 'package:first_project_dio/model/user.dart';

class UserSession {
  final String token;
  final dynamic refresh_token;
  final User user;

  UserSession({
    required this.token,
    required this.refresh_token,
    required this.user
  });

  static UserSession? _currentSession;

  static void setSession(UserSession data) {
    _currentSession = data;
  }

  static UserSession? getSession() {
    return _currentSession;
  }

  static bool hasSession() {
    return _currentSession != null;
  }

  static void clearSession() {
    _currentSession = null;
  }


  factory UserSession.fromJson(Map<String, dynamic> json){
    return UserSession(
      user: User.fromJson(json['user']),
      token: json['token'],
      refresh_token: json['refresh_token'],
    );
  }
}

// Fazer o service
// lidar com a logica nas outras camadas
// se for sucesso armazenar token e dados do usuario e redirecionar para rota
// ver como lidar com refresh token

