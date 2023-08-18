import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
    required this.title
  });

  final String title;

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  String username = '';
  String password = '';

  void handleSubmit(
    String username,
    String password
  ) {
    print(username);
    print(password);
    Navigator.pushNamed(context, '/home');
  }

  void handleSignUpRedirect() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
            widget.title,
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
                      onChanged: (value) => setState(() => username = value),
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
                      onChanged: (value) => setState(() => password = value),
                    ),
              ),
              
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () => handleSubmit(username, password),
                      child: const Text('Login'),
                  ),
                ), 
              ),

              GestureDetector(
                onTap: () => handleSignUpRedirect(),
                child: Container(
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black, width: 1.0)),
                ),
                margin: const EdgeInsets.only(top: 50.0),
                child: const Text(
                   'Sign Up',
                  ),
                ), 
              )
            ],
        ),
        )
      ),
    );
  }
}