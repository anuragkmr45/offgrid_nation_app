import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';
import 'package:offgrid_nation_app/core/ui_share/custom_input_field.dart';
import 'package:offgrid_nation_app/core/ui_share/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
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
      // TODO: Add login API call here.
      Navigator.pushReplacementNamed(context, '/home/feed');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Login'),
          backgroundColor: AppColors.primary.withOpacity(0.9),
        ),
        child: _buildContent(isIOS: true),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: AppColors.primary,
        ),
        body: _buildContent(isIOS: false),
      );
    }
  }

  Widget _buildContent({required bool isIOS}) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.primary,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // App Logo
                Image.asset(
                  'lib/assets/images/image.png',
                  width: 100,
                  height: 100,
                ).animate().fadeIn(duration: 800.ms),

                const SizedBox(height: 16),

                // Username / Phone number or email field using CustomInputField
                CustomInputField(
                  controller: _emailController,
                  placeholder: 'Username, Phone number or email',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username, phone, or email';
                    }
                    return null;
                  },
                ).animate().fadeIn(duration: 800.ms, delay: 200.ms),

                const SizedBox(height: 16),

                // Password Field using CustomInputField
                CustomInputField(
                  controller: _passwordController,
                  placeholder: 'Password',
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
                ).animate().fadeIn(duration: 800.ms, delay: 400.ms),

                // Forgot Password link
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to the reset password screen
                      Navigator.pushNamed(context, '/auth/reset');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ).animate().fadeIn(duration: 800.ms, delay: 600.ms),

                // "Log In" button using CustomButton
                const SizedBox(height: 12),
                CustomButton(
                  onPressed: _login,
                  text: 'Log In',
                  backgroundColor: Colors.white,
                  textColor: AppColors.primary,
                  height: 45,
                  width: 350,
                  borderRadius: 30,
                ).animate().fadeIn(duration: 800.ms, delay: 800.ms),

                // Separator line with "OR"
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('OR', style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(child: Divider(color: Colors.white)),
                  ],
                ).animate().fadeIn(duration: 800.ms, delay: 1000.ms),

                // Social Media Buttons using CustomButton (Google & Apple only)
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    // TODO: Add your Google login logic here.
                  },
                  text: 'Continue with Google',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  height: 48,
                  width: double.infinity,
                  borderRadius: 8,
                ).animate().fadeIn(duration: 800.ms, delay: 1200.ms),

                const SizedBox(height: 12),
                CustomButton(
                  onPressed: () {
                    // TODO: Add your Apple login logic here.
                  },
                  text: 'Continue with Apple',
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  height: 48,
                  width: double.infinity,
                  borderRadius: 8,
                ).animate().fadeIn(duration: 800.ms, delay: 1400.ms),

                // Sign Up link
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/auth/signup');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ).animate().fadeIn(duration: 800.ms, delay: 1600.ms),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
