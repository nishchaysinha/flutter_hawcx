import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hawcx Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Do not use const here
      routes: <String, WidgetBuilder>{ // Explicitly specify types for clarity
        '/': (BuildContext context) => SignupScreen(),
        '/home': (BuildContext context) => HomeScreen(),
        '/signin': (BuildContext context) => SignInScreen(),
        '/verification': (BuildContext context) => VerificationScreen(),
      },
    );
  }
}
