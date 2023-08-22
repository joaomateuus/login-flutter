import 'package:first_project_dio/model/user.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<User> createUser(User userData) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/account/auth/signup'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String> {
      'email': userData.email,
      'username': userData.username,
      'password': userData.password,
    })
  );

  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create user');
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void handleSubmit() {
    username = usernameController.text;
    email = emailController.text;
    password = passwordController.text;
    confirmPassword = confirmPasswordController.text;

    print(username);
    print(email);

    if(password != confirmPassword) {
      print('Passwords do not match');
      return;
    }
    User userData = User(
      username: username,
      email: email,
      password: password
    );

    createUser(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Sign Up',
        ),
      ),
      body: Form(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(maxWidth: 310),
                margin: const EdgeInsets.only(top: 10.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0
                        ),
                        isDense: true, 
                      ),
                      controller: usernameController,
                    ),
              ),

              Container(
                constraints: const BoxConstraints(maxWidth: 310),
                margin: const EdgeInsets.only(top: 10.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0
                        ),
                        isDense: true, 
                      ),
                      controller: emailController,
                    ),
              ),
                
              Container(
                constraints: const BoxConstraints(maxWidth: 310),
                margin: const EdgeInsets.only(top: 10.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0
                        ),
                        isDense: true, 
                      ),
                      controller: passwordController,
                    ),
              ),

              Container(
                constraints: const BoxConstraints(maxWidth: 310),
                margin: const EdgeInsets.only(top: 10.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0
                        ),
                        isDense: true, 
                      ),
                      controller: confirmPasswordController,
                    ),
              ),
              
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () => handleSubmit(),
                      child: const Text('Sign Up'),
                  ),
                ), 
              ),
            ],
        ),
        )
      )
      
    );
  }
}