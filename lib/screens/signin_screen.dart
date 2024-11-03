import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  static const platform = MethodChannel('com.example.flutter_hawcx/hawcx');
  final TextEditingController _emailController = TextEditingController();
  bool _loading = false;

  Future<void> handleOTPRequest() async {
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your email'))
      );
      return;
    }

    setState(() => _loading = true);

    try {
      // Request OTP by calling the 'signIn' method on the platform channel
      await platform.invokeMethod('signIn', {'username': email});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP sent for verification!'))
      );
      // Navigate to OTP verification screen, passing the email as an argument
      Navigator.pushNamed(context, '/verification', arguments: email);
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to request OTP: ${e.message}'))
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: _loading ? null : handleOTPRequest,
              child: Text(_loading ? 'Requesting OTP...' : 'Request OTP'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: Text("Don't have an account? Sign Up"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/accountRestore'),
              child: Text('Restore Account'),
            ),
          ],
        ),
      ),
    );
  }
}