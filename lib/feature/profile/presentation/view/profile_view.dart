import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/feature/Auth/presentation/view_model/auth_cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:glowvana/feature/profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<SignOutCubit>(),
        child: const ProfileViewBody(
       
        ),
      ),
    ));
  }
}
