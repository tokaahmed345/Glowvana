import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/feature/tracking/presentation/view/widgets/custom_progress_indicator.dart';
import 'package:glowvana/feature/tracking/presentation/view/widgets/custom_routine_card.dart';
import 'package:glowvana/feature/tracking/presentation/view/widgets/custom_track_masks.dart';
import 'package:glowvana/feature/tracking/presentation/view_model/cubit/tracker_cubit.dart';
import 'package:glowvana/feature/tracking/presentation/view_model/cubit/tracker_state.dart';

class TrackerViewBody extends StatelessWidget {
  const TrackerViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/background_tracker.jfif",
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child:
                    BlocBuilder<RoutineTrackerCubit, RoutineTrackerState>(
                  builder: (context, state) {
                    if (state is RoutineTrackerFailure) {
                      return Center(child: Text(state.message));
                    }

                    final steps =
                        state is RoutineTrackerSuccess ? state.steps : [];
                    final isMaskChecked =
                        state is RoutineTrackerSuccess && state.maskUsed;
                    final completed = steps.where((e) => e.isDone).length +
                        (isMaskChecked ? 1 : 0);
                    final total = steps.length + 1;
                    final progress = total > 0 ? completed / total : 0;

                    return Column(
                      children: [
                        CustomProgressIndicator(
                          progress: progress.toDouble(),
                          completed: completed,
                          total: total,
                        ),
                        const SizedBox(height: 24),
                        ...steps.map(
                          (step) => CustomRoutineCard(
                            label: step.title,
                            isChecked: step.isDone,
                            icon: Icons.check_circle_outline,
                            onChanged: (_) {
                              context
                                  .read<RoutineTrackerCubit>()
                                  .toggleStep(step);
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTrackMasks(
                          isChecked: isMaskChecked,
                          onChanged: (val) {
                            context
                                .read<RoutineTrackerCubit>()
                                .toggleMaskUsage(val ?? false);
                          },
                        ),
                      ],
                    );
                  },
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
