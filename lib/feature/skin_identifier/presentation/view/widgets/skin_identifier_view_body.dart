import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/app_screens/app_screens.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/core/utils/widgets/custom_elevated_button.dart';
import 'package:glowvana/feature/skin_identifier/presentation/view/widgets/pick_image.dart';
import 'package:glowvana/feature/skin_identifier/presentation/view/widgets/skin_type_button.dart';
import 'package:glowvana/feature/skin_identifier/presentation/view_model/cubits/cubit/detect_and_pick_image.dart';
import 'package:go_router/go_router.dart';

class SkinIdentifierViewBody extends StatefulWidget {
  const SkinIdentifierViewBody({super.key});

  @override
  State<SkinIdentifierViewBody> createState() => _SkinIdentifierViewBodyState();
}

class _SkinIdentifierViewBodyState extends State<SkinIdentifierViewBody> {
  String? selectedType;
  bool isPicked = false;

  void onSkinTypeSelected(String type) {
    setState(() {
      selectedType = type;
    });
  }

  void pickedImage(bool pick) {
    setState(() {
      isPicked = pick;
    });
  }

  bool get isEnabeledButton => selectedType != null || isPicked;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PickAndDetectImage, PickAndDetectState>(
      listener: (context, state) {
        if (state is PredictionResult) {
          pickedImage(true);
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/back.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: AppColors.black.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  'If you know your skin type, select it from here',
                  style: AppStyle.text24.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SkinTypeButton(
                      label: 'Dry',
                      color: AppColors.brownRosy,
                      isSelected: selectedType == 'Dry',
                      onTap: () => onSkinTypeSelected('Dry'),
                    ),
                    SkinTypeButton(
                      label: 'Oily',
                      color: AppColors.primary,
                      isSelected: selectedType == 'Oily',
                      onTap: () => onSkinTypeSelected('Oily'),
                    ),
                    SkinTypeButton(
                      label: 'Combination',
                      color: AppColors.salmon,
                      isSelected: selectedType == 'Combination',
                      onTap: () => onSkinTypeSelected('Combination'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(height: 20),
                Text(
                  "Not sure? Upload a clear photo of your skin and we'll help you",
                  style: AppStyle.text16.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 16),
                const PickImage(),
                const Spacer(),
              
                CustomElevatedButton(
                  textColor: AppColors.black.withOpacity(.7),
                  color: Colors.transparent,
                  onPressed: (){GoRouter.of(context).push(AppScreens.signUp);},
                  text: 'Go To Registration',
                  
                  isEnabeled: isEnabeledButton,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
