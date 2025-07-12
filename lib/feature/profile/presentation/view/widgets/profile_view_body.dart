import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/assets/app_assets.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/app_screens/app_screens.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/core/utils/widgets/custom_background.dart';
import 'package:glowvana/core/utils/widgets/custom_elevated_button.dart';
import 'package:glowvana/feature/Auth/presentation/view_model/auth_cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:glowvana/feature/profile/presentation/view/widgets/profile_image.dart';
import 'package:go_router/go_router.dart';
class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });
  void _signOut(BuildContext context) {
    context.read<SignOutCubit>().signOut();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          GoRouter.of(context).go(AppScreens.skinIdentifier);
        } else if (state is SignOutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Stack(
        children: [
          const CustomBackgrounds(
              morningBackgroundImage: AppAssets.profileBackground,
              nightBackgroundImage: AppAssets.nightProfile),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 80),
              child: Column(
                children: [
                  const ProfileImageWidget(),
                  const SizedBox(height: 16),
                  Text(
                      getIt.get<FirebaseAuth>().currentUser?.displayName ??
                          "User",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.black)),
                  const SizedBox(height: 8),
                  Text(
                      getIt.get<FirebaseAuth>().currentUser?.email ??
                          "email@example.com",
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 32),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () => _signOut(context),
                    text: 'LogOut',
                    color: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .backgroundColor!
                            .resolve({}) ??
                        AppColors.brownOrange,
                    textColor: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .foregroundColor!
                            .resolve({}) ??
                        AppColors.white,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
