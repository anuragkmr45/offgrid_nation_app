import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 45,
    this.width = 350,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 40,
  });

  @override
  Widget build(BuildContext context) {
    // Use CupertinoButton for iOS, ElevatedButton for other platforms.
    if (Platform.isIOS) {
      return SizedBox(
        height: height,
        width: width,
        child: CupertinoButton(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(borderRadius),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor ?? Colors.white, fontSize: 14),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(color: textColor ?? Colors.white, fontSize: 14),
          ),
        ),
      );
    }
  }
}
