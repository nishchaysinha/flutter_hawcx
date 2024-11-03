import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  static const platform = MethodChannel('com.example.flutter_hawcx/hawcx');
  final TextEditingController _otpController = TextEditingController();
  bool _loading = false;

  Future<void> handleVerifyOTP(String email) async {
    String otp = _otpController.text.trim();
    if (otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter the OTP'))
      );
      return;
    }

    setState(() => _loading = true);

    try {
      await platform.invokeMethod('handleVerifyOTP', {
        'username': email,
        'otp': otp,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification successful!'))
      );
      Navigator.pushReplacementNamed(context, '/home');
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP verification failed: ${e.message}'))
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _otpController,
                  decoration: InputDecoration(labelText: 'OTP'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _loading ? null : () => handleVerifyOTP(email),
                  child: Text(_loading ? 'Verifying...' : 'Verify OTP'),
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
