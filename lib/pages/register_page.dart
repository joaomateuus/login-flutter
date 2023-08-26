import 'package:first_project_dio/viewmodel/register_viewmodel.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerViewModel = RegisterViewModelImpl();

  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void resetInputs() {
    usernameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';  
  }

  void handleSubmit() async{
    if (password != confirmPassword) {
      print('Passwords do not match');
      return;
    }

    registerViewModel.username = usernameController.text;
    registerViewModel.email = emailController.text;
    registerViewModel.password = passwordController.text;

    final response = await registerViewModel.createUser();

    // validar a logica de limpar campos e verificar o retorno do service
    if(response) {
      resetInputs();
      registerViewModel.resetFields();
    } else {
      print('Failed to create user');
    }
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
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
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
