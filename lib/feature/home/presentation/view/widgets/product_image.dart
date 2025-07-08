
import 'package:flutter/material.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/cashed_image_from_hive.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key, required this.routineModel,
  });
  final RoutineModel routineModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedImageFromHive(
          imageUrl:   routineModel.imageUrl,
            height: MediaQuery.of(context).size.height*.7,
            width: double.infinity,
          ),
          
          
        ),
      ),
    );
  }
}
