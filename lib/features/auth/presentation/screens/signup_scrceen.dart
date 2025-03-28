import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import your custom components and theme constants.
import 'package:offgrid_nation_app/core/ui_share/custom_button.dart';
import 'package:offgrid_nation_app/core/ui_share/custom_input_field.dart';
import 'package:offgrid_nation_app/core/ui_share/custom_text.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  int _currentStep = 0; // 0 -> user/phone, 1 -> OTP, 2 -> password

  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set status bar color to white with dark icons
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// Handles the Next button to progress through steps.
  void _onNext() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep++;
      } else {
        // TODO: Handle final submission (create account)
        debugPrint('Account created!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        backgroundColor: AppColors.primary,
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Create an Account'),
          backgroundColor: AppColors.primary.withOpacity(0.9),
        ),
        child: SafeArea(child: _buildBody()),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          title: const Text('Create an Account'),
          backgroundColor: AppColors.primary,
        ),
        body: SafeArea(child: _buildBody()),
      );
    }
  }

  Widget _buildBody() {
    return Column(
      children: [
        // Expanded scrollable content.
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder:
                  (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
              child: _buildStepContent(key: ValueKey(_currentStep)),
            ),
          ),
        ),
        // Fixed bottom container with button and sign in text.
        Container(
          width: double.infinity,
          color: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                onPressed: _onNext,
                text: 'Next',
                backgroundColor: Colors.white,
                textColor: AppColors.primary,
                height: 45,
                width: double.infinity,
                borderRadius: 30,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/auth/login');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomText(
                      text: "Already have an account? ",
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    CustomText(
                      text: 'Sign In',
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Returns the step content for the current step.
  Widget _buildStepContent({Key? key}) {
    switch (_currentStep) {
      // Step 0: Username & Phone
      case 0:
        return Container(
          key: key,
          child: Column(
            children: [
              CustomInputField(
                controller: _usernameController,
                placeholder: 'User name',
                keyboardType: TextInputType.text,
                validator: (_) => null, // Example placeholder
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  // Country code dropdown (placeholder)
                  Container(
                    width: 80,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('🇺🇸 '),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomInputField(
                      controller: _phoneController,
                      placeholder: 'Phone number',
                      keyboardType: TextInputType.phone,
                      validator: (_) => null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      // Step 1: OTP
      case 1:
        return Container(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputField(
                controller: _otpController,
                placeholder: 'Enter OTP',
                keyboardType: TextInputType.number,
                validator: (_) => null,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Have not received? ',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Resend OTP logic
                      debugPrint('Resend OTP');
                    },
                    child: const CustomText(
                      text: 'Resend',
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      // Step 2: Create/Confirm Password
      case 2:
        return Container(
          key: key,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  CustomInputField(
                    controller: _passwordController,
                    placeholder: 'Create a Password',
                    obscureText: true,
                    validator: (_) => null,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  CustomInputField(
                    controller: _confirmPasswordController,
                    placeholder: 'Confirm Password',
                    obscureText: true,
                    validator: (_) => null,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
