
import 'package:flutter/material.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';

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
          child: Image.network(
routineModel.imageUrl,
            height: MediaQuery.of(context).size.height*.7,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
