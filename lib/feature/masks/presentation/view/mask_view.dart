import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/core/utils/helpers/user_setting_storage/hive_helper.dart';
import 'package:glowvana/feature/masks/presentation/view/widgets/mask_view_body.dart';
import 'package:glowvana/feature/masks/presentation/view_model/cubit/mask_skin_cubit.dart';

class MaskView extends StatelessWidget {
  const MaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<MaskSkinCubit>()..getMasks(getIt.get<UserSettingsStorage>().getSkinType()),
      child: const Scaffold(
        body: MaskViewBody(),
      ),
    );
  }
}
