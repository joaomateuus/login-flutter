import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

void logout(BuildContext context) {
  Navigator.pushNamed(context, '/');
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
            'Home',
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child:  const Text('Welcome to the Home Page'), 
            ),
           
            Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () => logout(context),
                      child: const Text('Logout'),
                  ),
                ), 
            ),
          ],
        ),
      ),
    );
  }
}