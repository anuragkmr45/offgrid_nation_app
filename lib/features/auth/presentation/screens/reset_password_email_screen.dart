import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';

class ResetPasswordEmailScreen extends StatefulWidget {
  const ResetPasswordEmailScreen({super.key});

  @override
  _ResetPasswordEmailScreenState createState() =>
      _ResetPasswordEmailScreenState();
}

class _ResetPasswordEmailScreenState extends State<ResetPasswordEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submitEmail() {
    if (_formKey.currentState!.validate()) {
      // TODO: Call API to send OTP.
      Navigator.pushNamed(context, '/auth/reset/otp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Reset Password'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter your email to receive an OTP',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter your email';
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                  ).hasMatch(value))
                    return 'Enter a valid email';
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _submitEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
