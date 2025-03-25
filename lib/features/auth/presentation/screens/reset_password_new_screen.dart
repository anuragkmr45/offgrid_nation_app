import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';

class ResetPasswordNewScreen extends StatefulWidget {
  const ResetPasswordNewScreen({super.key});

  @override
  _ResetPasswordNewScreenState createState() => _ResetPasswordNewScreenState();
}

class _ResetPasswordNewScreenState extends State<ResetPasswordNewScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _setNewPassword() {
    if (_formKey.currentState!.validate()) {
      // TODO: Update password API call.
      Navigator.pushNamed(context, '/auth/reset/confirmation');
    }
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Set New Password'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter new password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm your password';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _setNewPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Set Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
