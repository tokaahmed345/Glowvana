import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/feature/skin_identifier/presentation/view_model/cubits/cubit/detect_and_pick_image.dart';

class PickImage extends StatelessWidget {
  const PickImage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickAndDetectImage, PickAndDetectState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PredictionResult) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.file(state.image, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Skin Type: ",
                    style: AppStyle.text16
                        .copyWith(fontSize: 22, color: AppColors.beige)),
                TextSpan(
                    text: state.prediction,
                    style: AppStyle.text24.copyWith(color: AppColors.primary)),
              ])),
            ],
          );
        } else {
          return GestureDetector(
            onTap: () =>
                context.read<PickAndDetectImage>().pickImageFromGallery(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.photo_outlined,
                size: 100,
                color: AppColors.primary,
              ),
            ),
          );
        }
      },
    );
  }
}
