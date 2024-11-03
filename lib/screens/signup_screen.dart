import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static const platform = MethodChannel('com.example.flutter_hawcx/hawcx');
  final TextEditingController _emailController = TextEditingController();
  bool _loading = false;

  Future<void> handleSignup() async {
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your email'))
      );
      return;
    }

    setState(() => _loading = true);

    try {
      await platform.invokeMethod('signUp', {'username': email});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP sent for verification!'))
      );
      Navigator.pushNamed(context, '/verification', arguments: email);
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed: ${e.message}'))
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _loading ? null : handleSignup,
                  child: Text(_loading ? 'Signing Up...' : 'Sign Up'),
                ),
                SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signin'),
                  child: Text('Already have an account? Sign In'),
                ),
              ],
            ),
          ),
          if (_loading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
