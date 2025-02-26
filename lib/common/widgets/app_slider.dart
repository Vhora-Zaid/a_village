import 'package:flutter/material.dart';

class DistanceSlider extends StatelessWidget {
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color textColor;

  const DistanceSlider({
    Key? key,
    required this.values,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 3,
        activeTrackColor: activeColor,
        inactiveTrackColor: inactiveColor,
        overlayColor: activeColor,
        thumbColor: activeColor,
      ),
      child: RangeSlider(
        values: values,
        min: 0,
        max: 100,
        onChanged: onChanged,
      ),
    );
  }
}
