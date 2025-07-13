import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/widgets/shimmer_placeholder.dart';
import 'package:glowvana/feature/masks/presentation/view/widgets/card_mask.dart';
import 'package:glowvana/feature/masks/presentation/view_model/cubit/mask_skin_cubit.dart';

class CustomMasksList extends StatelessWidget {
  const CustomMasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaskSkinCubit, MaskSkinState>(
      builder: (context, state) {
        if (state is MaskSkinSuccess) {
          return ListView.builder(
              itemCount: state.masks.length,
              itemBuilder: (context, index) {
                final masks = state.masks[index];
                return MaskCard(
                  name: masks.maskName,
                  description: masks.description,
                  frequency: masks.frequency,
                  imageLink: masks.imageLink,
                  ingredients: masks.ingredients,
                  tutorialLink: masks.tutorialLink,
                  instructions: masks.instructions,
                );
              });
        } else if (state is MaskSkinFailure) {
          return Text(state.errorMessage);
        } else {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: ShimmerPlaceholder(
                height: MediaQuery.of(context).size.height * .6,
              ),
            ),
          );
        }
      },
    );
  }
}
