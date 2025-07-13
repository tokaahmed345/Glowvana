import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/app_screens/app_screens.dart';
import 'package:glowvana/core/utils/widgets/shimmer_placeholder.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/routine_steps.dart';
import 'package:glowvana/feature/home/presentation/view_model/cubit/routine_steps_cubit.dart';
import 'package:go_router/go_router.dart';
class CustomRoutineStepsList extends StatelessWidget {
const CustomRoutineStepsList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutineStepsCubit, RoutineStepsState>(
      builder: (context, state) {
        if (state is RoutineStepsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final steps = state.routines[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: RoutineSteps(
                    onTap: () {
                      GoRouter.of(context)
                          .push(AppScreens.routineDetails, extra: steps);
                    },
                    image: steps.imageUrl,
                    stepNumber: steps.stepOrder.toString(),
                    stepTitle: steps.title,
                    description: steps.description,
                  ),
                );
              },
              childCount: state.routines.length,
            ),
          );
        } else if (state is RoutineStepsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>  Padding(
                padding:const  EdgeInsets.only(bottom: 18),
                child: ShimmerPlaceholder(height:   MediaQuery.of(context).size.height * .3),
              ),
              childCount: 7,
            ),
          );
        }
      },
    );
  }
}
