// lib/app.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';
import 'package:offgrid_nation_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/login_screen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/signup_scrceen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/reset_password_email_screen.dart';
import 'package:offgrid_nation_app/features/root/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        title: 'OffGrid Nation',
        theme: _buildCupertinoTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/auth/login': (context) => const LoginScreen(),
          '/auth/signup': (context) => const CreateAccountScreen(),
          '/home/feed': (context) => const FeedScreen(),
          '/auth/reset': (context) => const ResetPasswordScreen(),
        },
      );
    } else {
      return MaterialApp(
        title: 'OffGrid Nation',
        theme: AppTheme.materialTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/auth/login': (context) => const LoginScreen(),
          '/auth/signup': (context) => const CreateAccountScreen(),
          '/home/feed': (context) => const FeedScreen(),
          '/auth/reset': (context) => const ResetPasswordScreen(),
        },
      );
    }
  }

  CupertinoThemeData _buildCupertinoTheme() {
    return CupertinoThemeData(
      primaryColor:
          AppTheme.cupertinoTheme()
              .primaryColor, // Extract the primary color from the CupertinoThemeData
      barBackgroundColor: CupertinoColors.systemGrey,
      scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
      textTheme: CupertinoTextThemeData(
        textStyle: const TextStyle(fontFamily: 'San Francisco'),
      ),
    );
  }
}
