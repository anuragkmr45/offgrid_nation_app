// lib/app.dart

import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';
import 'package:offgrid_nation_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/login_screen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/reset_password_email_screen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/reset_password_otp_screen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/reset_password_new_screen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/reset_password_confirmation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: AppTheme.materialTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth/login': (context) => const LoginScreen(),
        '/auth/reset': (context) => const ResetPasswordEmailScreen(),
        '/auth/reset/otp': (context) => const ResetPasswordOtpScreen(),
        '/auth/reset/new_password': (context) => const ResetPasswordNewScreen(),
        '/auth/reset/confirmation':
            (context) => const ResetPasswordConfirmationScreen(),
        // ... add additional routes here
      },
    );
  }
}
