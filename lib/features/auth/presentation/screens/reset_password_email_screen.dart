import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';
import 'package:offgrid_nation_app/core/ui_share/custom_button.dart';
import 'package:offgrid_nation_app/core/ui_share/custom_input_field.dart';
import 'package:offgrid_nation_app/core/ui_share/custom_modal.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  // Step indexes:
  // 0 -> Enter email
  // 1 -> Enter OTP code
  // 2 -> Enter new password & confirm
  int _currentStep = 0;

  // Controllers
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  /// Handles the “Continue” button logic for each step.
  void _onContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        if (_currentStep < 2) {
          _currentStep++;
        } else {
          _showSuccessModal();
        }
      });
    }
  }

  /// Shows the success modal using CustomModal.
  void _showSuccessModal() {
    CustomModal.show(
      context: context,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 60),
          const SizedBox(height: 20),
          const Text(
            'Reset Password Successful!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'You will be directed to the login screen.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: CustomButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to the login screen
              Navigator.pushReplacementNamed(context, '/auth/login');
            },
            text: 'OK',
            backgroundColor: AppColors.primary,
            textColor: Colors.white,
            height: 40,
            width: 80,
            borderRadius: 20,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Use platform-aware scaffolding.
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        backgroundColor: AppColors.primary,
        navigationBar: CupertinoNavigationBar(
          middle: Text(_getStepTitle()),
          backgroundColor: AppColors.primary.withOpacity(0.9),
        ),
        child: SafeArea(child: _buildBody()),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          title: Text(_getStepTitle()),
          backgroundColor: AppColors.primary,
        ),
        body: SafeArea(child: _buildBody()),
      );
    }
  }

  /// Returns a title for each step.
  String _getStepTitle() {
    switch (_currentStep) {
      case 0:
        return 'Reset Your Password';
      case 1:
        return 'OTP Verification';
      case 2:
        return 'Create New Password';
      default:
        return 'Reset Your Password';
    }
  }

  Widget _buildBody() {
    return Column(
      children: [
        // Content area with form fields.
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Logo at top-right
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'lib/assets/images/image.png',
                          width: 60,
                          height: 60,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // AnimatedSwitcher to transition between steps.
                    AnimatedSwitcher(
                      duration: 400.ms,
                      transitionBuilder:
                          (child, animation) =>
                              FadeTransition(opacity: animation, child: child),
                      child: _buildStepContent(key: ValueKey(_currentStep)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Continue button fixed at the bottom.
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            onPressed: _onContinue,
            text: 'Continue',
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            height: 45,
            width: double.infinity,
            borderRadius: 30,
          ),
        ).animate().fadeIn(duration: 400.ms, delay: 200.ms),
      ],
    );
  }

  /// Builds the content for the current step.
  Widget _buildStepContent({Key? key}) {
    switch (_currentStep) {
      // Step 0: Enter email.
      case 0:
        return Container(
          key: key,
          child: CustomInputField(
            controller: _emailController,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
        );
      // Step 1: Enter OTP.
      case 1:
        return Container(
          key: key,
          child: CustomInputField(
            controller: _otpController,
            placeholder: 'Enter OTP',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the OTP';
              }
              if (value.length < 4) {
                return 'OTP should be at least 4 digits';
              }
              return null;
            },
          ),
        );
      // Step 2: Enter new password & confirm.
      case 2:
        return Container(
          key: key,
          child: Column(
            children: [
              CustomInputField(
                controller: _newPasswordController,
                placeholder: 'New Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomInputField(
                controller: _confirmNewPasswordController,
                placeholder: 'Confirm New Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your new password';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
