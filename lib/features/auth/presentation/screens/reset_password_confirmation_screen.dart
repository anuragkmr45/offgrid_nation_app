import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';

class ResetPasswordConfirmationScreen extends StatelessWidget {
  const ResetPasswordConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Password Reset'),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: AppColors.primary, size: 100),
            const SizedBox(height: 24.0),
            const Text(
              'Your password has been reset successfully!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to login screen
                Navigator.pushReplacementNamed(context, '/auth/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 16,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
