import 'package:flutter/material.dart';
import 'package:glowvana/feature/masks/presentation/view/widgets/custom_mask_list.dart';

class MaskViewBody extends StatelessWidget {
  const MaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    final isNight=theme.brightness==Brightness.dark;
    final backgroundImage=isNight?"assets/images/night_mask_background.png":'assets/images/background_masks.png';


    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
           backgroundImage,
         fit: BoxFit.cover,
        )),
        const Positioned.fill(
          child: Column(
            children: [
              Expanded(
                child: CustomMasksList(),
              )
            ],
          ),
        )
      ],
    );
  }
}
