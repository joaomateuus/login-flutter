import 'package:first_project_dio/model/user_model.dart';
import 'package:first_project_dio/service/user_services.dart';

class UserRepository {
  final userService = UserService();

  Future<bool> createUser(User userData) async {
    final response = await userService.createUser(userData);

    return response ? true : false;
  }
}
