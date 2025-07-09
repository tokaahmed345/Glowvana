import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';

class GlassBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const GlassBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: AppColors.white.withOpacity(0.2),
          selectedLabelStyle:
              Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
          unselectedLabelStyle:
              Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
          selectedIconTheme:
              Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
          unselectedIconTheme:
              Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 40,
                ),
                label: 'Routine'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.spa,
                  size: 40,
                ),
                label: 'Masks'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_drink,
                  size: 40,
                ),
                label: 'Juices'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.track_changes,
                  size: 40,
                ),
                label: 'Tracker'),
          ],
        ),
      ),
    );
  }
}
