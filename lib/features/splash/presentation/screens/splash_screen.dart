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
        backgroundColor: AppColors.background,
        child: _buildContent(),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: _buildContent(),
      );
    }
  }

  /// Builds the common content for the splash screen.
  Widget _buildContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App logo using an asset image.
          Image.asset('lib/assets/images/image.png', width: 100, height: 100),
          const SizedBox(height: 20),
          // App Name Text
          Text(
            'OffGrid Nation',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
