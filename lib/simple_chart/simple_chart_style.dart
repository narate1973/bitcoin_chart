import 'package:flutter/material.dart';

class SimpleChartStyle {
  /// timeLabelSectionHeight = textHeight + somePadding
  final double timeLabelSectionHeight;
  final double timeLabelWidth;
  final Color lineColor;
  final double maXPriceLabelWidth;
  final TextStyle timeLabelStyle;
  final TimeFrequency timeFrequency;
  final Color bottomRightBorderColor;
  final TextStyle priceLabelStyle;
  final Color overlayInfoLineColor;
  final TextStyle overlayTextStyle;
  final Color overlayBackgroundColor;

  const SimpleChartStyle({
    this.timeLabelSectionHeight = 30,
    this.overlayBackgroundColor = const Color(0xEE757575),
    this.bottomRightBorderColor = Colors.grey,
    this.overlayInfoLineColor = Colors.red,
    this.overlayTextStyle = const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    this.priceLabelStyle = const TextStyle(
      fontSize: 12,
      color: Colors.grey,
    ),
    this.timeLabelWidth = 45,
    this.maXPriceLabelWidth = 48,
    this.lineColor = Colors.blue,
    this.timeLabelStyle = const TextStyle(
      fontSize: 16,
      color: Colors.grey,
    ),
    this.timeFrequency = TimeFrequency.twoMinute,
  });
}

enum TimeFrequency {
  twoMinute,
  fiveMinute,
  tenMinute;

  const TimeFrequency();

  double get periodInMin {
    switch (this) {
      case TimeFrequency.twoMinute:
        return 2;
      case TimeFrequency.fiveMinute:
        return 5;
      case TimeFrequency.tenMinute:
        return 10;
    }
  }
}
