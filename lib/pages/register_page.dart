import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = '';
  String email = '';
  String passowrd = '';
  String confirmPassword = '';

  void handleSubmit() {
    if(passowrd != confirmPassword) {
      print('Passwords do not match');
      return;
    }

    print(username);
    print(email);
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
                      onChanged: (value) => setState(() => username = value),
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
                      onChanged: (value) => setState(() => email = value),
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
                      onChanged: (value) => setState(() => passowrd = value),
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
                      onChanged: (value) => setState(() => confirmPassword = value),
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