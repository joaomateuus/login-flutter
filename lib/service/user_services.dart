import '../model/user_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  Future<bool> createUser(User userData) async {
    try {
      final response = await http.post(Uri.parse(
        'http://localhost:3000/account/auth/signup'
      ),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': userData.email,
        'username': userData.username,
        'password': userData.password,
      }));

      if(response.statusCode == 201) {
        return true;
      } else {
        return false;
      }

      // User user = User.fromJson(
      //   jsonDecode(response.body)
      // );
    } catch(e) {
      print('Failed to fetch user, Original Exception: $e');
      return false;
    }
  }

  // Future<void> getUser(Int id) {
  //   try { print('') } catch (e) { print(e);}
  // }

  // Future<void> login(String username, String password) {
  //   try { print('') } catch (e) { print(e);}
  // }
  
}