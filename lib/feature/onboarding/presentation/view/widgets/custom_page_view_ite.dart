
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/feature/onboarding/presentation/view/widgets/custom_arrow_button.dart';

class CustomPageViewItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final VoidCallback onNext;
  final VoidCallback ?onBack; 

  const CustomPageViewItem({super.key, 
    required this.title,
    required this.description,
    required this.image,
    required this.onNext,
     this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style:  AppStyle.text24,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: AppStyle.text16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

            
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomArrowButton(forward: onNext, icon:Icons.arrow_forward_ios),
                ],
              ),

          
        ],
      ),
    );
  }
}
