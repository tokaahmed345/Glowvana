
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';


class RoutineSteps extends StatelessWidget {
  const RoutineSteps({super.key, required this.stepNumber, required this.stepTitle, required this.description, required this.image, required this.onTap,});
final String stepNumber;
final String stepTitle;
final  String description;
final String image;
 final void Function() onTap;
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
    onTap: onTap,
     child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFB87036),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Step\n$stepNumber',
              textAlign: TextAlign.center,
              style:AppStyle.text24.copyWith(color: AppColors.white,fontSize: 20)
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stepTitle,
                  style: AppStyle.text24.copyWith(color: AppColors.brownAccent)
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style:  AppStyle.text16.copyWith(color: AppColors.brownAccent)
     
                ),
              ],
            ),
          ),
Image.network(
  image,
  width: MediaQuery.of(context).size.width * .25,
  height: MediaQuery.of(context).size.height * .2,
  fit: BoxFit.cover,
),
        ]
//         CachedNetworkImage(
//   imageUrl: image,
//   placeholder: (context, url) => const CircularProgressIndicator(),
//   errorWidget: (context, url, error) => const Icon(Icons.error),
//   width: MediaQuery.of(context).size.width * .25,
//   height: MediaQuery.of(context).size.height * .2,
//   fit: BoxFit.cover,
// )

         
      )
     ),
   );
  }
  
}  
 
 

