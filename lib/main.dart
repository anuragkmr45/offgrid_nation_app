import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';
import 'package:offgrid_nation_app/features/root/presentation/widget/chat/conversation_screen.dart';
import 'package:offgrid_nation_app/features/root/wrapper/root_screen.dart';
import 'package:offgrid_nation_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/login_screen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/signup_scrceen.dart';
import 'package:offgrid_nation_app/features/auth/presentation/screens/reset_password_email_screen.dart';

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
          '/auth/reset': (context) => const ResetPasswordScreen(),
          '/home': (context) => const RootScreen(),
          '/conversation': (context) => const ConversationScreen(),
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
          '/auth/reset': (context) => const ResetPasswordScreen(),
          '/home': (context) => const RootScreen(),
          '/conversation': (context) => const ConversationScreen(),
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
