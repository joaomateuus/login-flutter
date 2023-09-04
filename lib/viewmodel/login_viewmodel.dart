// import 'dart:convert';
import 'package:first_project_dio/model/user_session.dart';
import 'package:first_project_dio/repository/user_repository.dart';

abstract class LoginViewModel {
  Future<bool> login();
  void resetFields();
} 

class LoginViewModelImpl extends LoginViewModel {
  String username = '';
  String password = '';

  final userRepository = UserRepository();

  @override
  void resetFields() {
    username = '';
    password = '';
  }

  @override
  Future<bool> login() async {
    final response = await userRepository.login(username, password);
    
    if (response != null) {
      UserSession.setSession(response);
    
      return true;
    } else {
      return false;
    }
  }
}