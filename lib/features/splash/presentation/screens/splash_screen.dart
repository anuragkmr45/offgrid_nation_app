import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the login screen after a delay.
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/auth/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    // For iOS, use a Cupertino-styled scaffold; otherwise, use Material Scaffold.
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        backgroundColor: AppColors.primary,
        child: _buildContent(),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.primary,
        body: _buildContent(),
      );
    }
  }

  /// Builds the common content for the splash screen.
  Widget _buildContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.8;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to ',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'lib/assets/images/image.png',
            width: imageWidth,
            height: 100,
          ),
          const SizedBox(height: 20),
          // App Name Text
          Text(
            'Connect, Expore, and Thrive',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
