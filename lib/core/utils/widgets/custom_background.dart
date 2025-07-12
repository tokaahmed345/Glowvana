
import 'package:flutter/material.dart';

class CustomBackgrounds extends StatelessWidget {
  const CustomBackgrounds({
    super.key,
    required this.morningBackgroundImage, required this.nightBackgroundImage,
  });

  final String morningBackgroundImage;
  final String nightBackgroundImage;
  
  @override
  Widget build(BuildContext context) {
    final isNight = Theme.of(context).brightness == Brightness.dark;
    final backgroundImage = isNight ? nightBackgroundImage : morningBackgroundImage;
    return Positioned.fill(
      child: Image.asset(
        backgroundImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
