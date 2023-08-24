import 'package:flutter/material.dart';

class FacultyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Faculty Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Code for Register Button
                print('Register button pressed');
              },
              child: Text('Register'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Code for Login Button
                print('Login button pressed');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Faculty Page',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: FacultyScreen(),
  ));
}
