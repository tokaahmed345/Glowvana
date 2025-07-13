
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/functions/custom_launch_url.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/cashed_image_from_hive.dart';

class MaskCard extends StatelessWidget {
  final String name;
  final String description;
  final String frequency;
  final String imageLink;
  final String ingredients;
    final String tutorialLink;
  final String instructions;


  const MaskCard({
    super.key,
    required this.name,
    required this.description,
    required this.frequency,
    required this.imageLink,
    required this.ingredients,
     required this.tutorialLink, 
     required this.instructions,
  });
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:  Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedImageFromHive(imageUrl: imageLink, width: 60, height: 60),
            
           
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name
              ,
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 4),
                Text(description,
                    style: theme.textTheme.bodySmall),
                const SizedBox(height: 8),
                Text(
                  '⏰ $frequency',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Ingredients:',
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                 ingredients,
                  style:theme.textTheme.bodySmall
                ),
                Text(
                  'Instructions:',
                  style: theme.textTheme.bodyLarge
                ),
                Text(
                  instructions,
                  style:theme.textTheme.bodySmall
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: (){
                      launchCustomUrl(context, tutorialLink);
                    },
                    child:  Text(
                      'View Tutorial ➜',
                      style: AppStyle.text24.copyWith(color: theme.elevatedButtonTheme.style!.backgroundColor?.resolve({}))
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
