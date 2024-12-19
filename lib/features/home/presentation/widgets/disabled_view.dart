import 'package:flutter/material.dart';
import 'package:kouider_app/core/theming/colors_manager.dart';
import 'package:kouider_app/core/theming/styles.dart';

class DisabledView extends StatelessWidget {
  const DisabledView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.scaffoldBackgroundColor,
      child: Center(
        child: Text(
          title,
          style: Styles.font11BottomNavMedium.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
