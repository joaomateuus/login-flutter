import 'package:first_project_dio/pages/home_page.dart';
import 'package:first_project_dio/pages/login_page.dart';
import 'package:first_project_dio/pages/register_page.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/home':(context) => const HomePage(),
        '/register':(context) => const RegisterPage() 
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(title: 'Login'),
    );
  }
}