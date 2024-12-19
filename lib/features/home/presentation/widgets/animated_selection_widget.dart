import 'package:flutter/material.dart';
import 'package:kouider_app/core/theming/styles.dart';

class AnimatedSelectionWidget extends StatefulWidget {
  const AnimatedSelectionWidget({super.key});

  @override
  State<AnimatedSelectionWidget> createState() =>
      _AnimatedSelectionWidgetState();
}

class _AnimatedSelectionWidgetState extends State<AnimatedSelectionWidget> {
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildAnimatedContainer(2, 'جميع الحلويات غربية'),
        SizedBox(width: 10),
        buildAnimatedContainer(1, 'تورت'),
        SizedBox(width: 10),
        buildAnimatedContainer(0, 'جاتوه'),
      ],
    );
  }

  Widget buildAnimatedContainer(int index, String text) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFFD4DBF1),
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(color: Color(0xFF425486), width: 1)
              : Border.all(color: Colors.transparent, width: 1),
        ),
        child: Text(
          text,
          style: isSelected
              ? Styles.font13SelectionWidgetActive
              : Styles.font13SelectionWidgetActive.copyWith(
                  color: Color(0xFF1D2128),
                ),
        ),
      ),
    );
  }
}
