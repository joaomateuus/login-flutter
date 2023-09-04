import 'package:first_project_dio/model/user_session.dart';

import '../model/user.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  Future<bool> createUser(User userData) async {
    try {
      final response = await http.post(
        Uri.parse(
          'http://localhost:3000/account/auth/signup'
        ),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': userData.email,
          'username': userData.username,
          'password': userData.password ?? '',
        }
      ));
 
      return response.statusCode == 201 ? true : false;

      // User user = User.fromJson(
      //   jsonDecode(response.body)
      // );
    } catch(e) {
      print('Failed to fetch user, Original Exception: $e');
      return false;
    }
  }

  Future<UserSession?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(
          'http://localhost:3000/account/auth/login'
        ),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }
      ));
     
      if (response.statusCode == 200) {
        final parsedJson = jsonDecode(response.body);
        final userSession = UserSession.fromJson(parsedJson);
        return userSession;
      } else {
        return null; // Trate os casos de erro de outra forma, se necessário
      }
      
      // return true;
    } catch (e) {
      print(e);
      return null;
      // return false;
    }
  }

  // Future<void> getUser(Int id) {
  //   try { print('') } catch (e) { print(e);}
  // }

  
  
}