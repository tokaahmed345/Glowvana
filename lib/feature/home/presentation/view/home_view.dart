import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/core/utils/storage/hive_helper.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/home_body_view.dart';
import 'package:glowvana/feature/home/presentation/view_model/cubit/routine_steps_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key , this.routineModel});
  final RoutineModel? routineModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

  final UserSettingsStorage userSettingsStorage=getIt.get<UserSettingsStorage>();

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
loadinRoutine();
    super.initState();
  }
  void loadinRoutine() {
 final skinType= userSettingsStorage.getSkinType();
context.read<RoutineStepsCubit>().getRoutineSteps(skinType, 'morning');
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(body: HomeBodyView(routineModel: widget.routineModel,),));
  }
  

}