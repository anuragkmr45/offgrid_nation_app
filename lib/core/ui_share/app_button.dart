import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? fontSize;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRadius;

  const AppButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fontSize,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(text, style: TextStyle(fontSize: fontSize ?? 16.0)),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor:
            foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 16.0,
          vertical: verticalPadding ?? 12.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
    );
  }
}
