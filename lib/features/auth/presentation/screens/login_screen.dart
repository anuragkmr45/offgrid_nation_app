import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';
import 'package:offgrid_nation_app/core/ui_share/input_field.dart';
import 'package:offgrid_nation_app/core/ui_share/app_button.dart'; // Import the reusable button

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // TODO: Add login logic here.
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Email Field
                AppInputField(
                  label: 'Email',
                  icon: Icons.email,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ).animate().fadeIn(duration: 800.ms),

                const SizedBox(height: 16.0),

                // Password Field
                AppInputField(
                  label: 'Password',
                  icon: Icons.lock,
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ).animate().fadeIn(duration: 800.ms, delay: 200.ms),

                const SizedBox(height: 24.0),

                // Reusable AppButton with icon + text
                AppButton(
                  text: 'Login',
                  icon: Icons.login,
                  onPressed: _login,
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.background,
                  fontSize: 18,
                  horizontalPadding: 80,
                  verticalPadding: 16,
                  borderRadius: 8,
                ).animate().fadeIn(duration: 800.ms, delay: 400.ms),

                const SizedBox(height: 16.0),

                // Forgot Password
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/auth/reset');
                  },
                  child: const Text('Forgot Password?'),
                ).animate().fadeIn(duration: 800.ms, delay: 600.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
