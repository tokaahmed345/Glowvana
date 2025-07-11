import 'package:flutter/material.dart';
import 'package:glowvana/feature/tracking/presentation/view/widgets/tracker_view_body.dart';

class TrackerView extends StatefulWidget {
  const TrackerView({super.key});

  @override
  State<TrackerView> createState() => _TrackerViewState();
}

class _TrackerViewState extends State<TrackerView> {
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
        child: Scaffold(
          body: TrackerViewBody(),
        ));
  }
}