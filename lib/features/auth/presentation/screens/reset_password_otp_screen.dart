import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';

class ResetPasswordOtpScreen extends StatefulWidget {
  const ResetPasswordOtpScreen({super.key});

  @override
  _ResetPasswordOtpScreenState createState() => _ResetPasswordOtpScreenState();
}

class _ResetPasswordOtpScreenState extends State<ResetPasswordOtpScreen> {
  final _otpController = TextEditingController();

  void _verifyOtp() {
    // TODO: Validate OTP.
    Navigator.pushNamed(context, '/auth/reset/new_password');
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('OTP Verification'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the OTP sent to your email',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'OTP Code',
                prefixIcon: Icon(Icons.confirmation_number),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _verifyOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 16,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
