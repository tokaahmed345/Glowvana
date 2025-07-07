import 'package:flutter/material.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/home_body_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key , this.routineModel});
  final RoutineModel? routineModel;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(body: HomeBodyView(routineModel: routineModel,),));
  }
}