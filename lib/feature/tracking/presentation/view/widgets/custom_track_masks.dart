import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/assets/app_assets.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';

class CustomTrackMasks extends StatelessWidget {
  const CustomTrackMasks({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.brown),
      ),
      child: Row(
        children: [
          Expanded(
            child: CheckboxListTile(
              value: isChecked,
              onChanged: onChanged,
              contentPadding: EdgeInsets.zero,
              title: Text("Used mask this week?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(
                  isChecked
                      ? "Well done! 🌸"
                      : "Don't forget your weekly mask! 💆‍♀️",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 16, color: AppColors.black)),
              activeColor: Theme.of(context).colorScheme.primary,
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          Image.asset(
            AppAssets.miniMask,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * .2,
            height: MediaQuery.of(context).size.height * .1,
          ),
        ],
      ),
    );
  }
}
