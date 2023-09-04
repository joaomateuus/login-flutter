import 'package:first_project_dio/model/user.dart';
import 'package:first_project_dio/model/user_session.dart';
import 'package:first_project_dio/service/user_services.dart';

class UserRepository {
  final userService = UserService();

  Future<bool> createUser(User userData) async {
    final response = await userService.createUser(userData);

    return response ? true : false;
  }

  Future<UserSession?> login(String username, String password) async {
    final response = await userService.login(username, password);

    return response != null ? response : null;
  }
}
