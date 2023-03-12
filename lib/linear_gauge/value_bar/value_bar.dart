import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

import '../linear_gauge_painter.dart';

class ValueBar {
  ///
  /// The [ValueBar]  can be used to represent the current value of the [LinearGauge].
  ///
  ///
  ///
  /// ```dart
  /// LinearGauge(
  /// valueBar: [
  /// ValueBar(
  /// value: 50,
  /// position: ValueBarPosition.top,
  /// color: Colors.amber,
  ///   ),
  ///  ]
  /// ),
  /// ```
  ///

  ValueBar({
    required this.value,
    this.offset = 0,
    this.position = ValueBarPosition.center,
    this.color = Colors.blue,
  });

  /// The `value` sets the value of the [ValueBar].
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       value: 50,
  ///       position: ValueBarPosition.top,
  ///       ),
  ///     ]
  /// ),
  /// ```
  final double value;

  ///
  /// The `offset` sets the offset of the [ValueBar] from the [LinearGauge].
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     offset: 50,
  ///     position: ValueBarPosition.top,
  ///      ),
  ///    ]
  /// ),
  /// ```
  /// The default value of `offset` is `0`.
  ///
  double offset;

  ///
  /// The `position` sets the position of the [ValueBar] in the [LinearGauge].
  /// The [ValueBarPosition] can be `top`, `bottom` or `center`.
  /// The default value of `position` is `ValueBarPosition.center`.
  ///
  /// ```dart
  /// const LinearGauge(
  ///   valueBar: [
  ///     ValueBar(
  ///       value: 50,
  ///       position: ValueBarPosition.top,
  ///      ),
  ///   ],
  /// ),
  /// ```
  ///
  final ValueBarPosition position;

  ///
  /// The `color` sets the color of the [ValueBar].
  /// The default value of `color` is `Colors.blue`.
  ///
  /// ```dart
  /// const LinearGauge(
  ///  valueBar: [
  ///   ValueBar(
  ///     value: 50,
  ///     position: ValueBarPosition.top,
  ///     color: Colors.amber,
  ///         ),
  ///       ],
  ///   ),
  /// ```
  Color color;

  ///
  /// Painter Method to Draw [ValueBar]
  ///

  void drawValueBar(Canvas canvas, double start, double end, double totalWidth,
      RenderLinearGauge linearGauge) {
    assert(value >= linearGauge.getStart && value <= linearGauge.getEnd,
        'Value should be between start and end values');

    // Start and End values of the Linear Gauge
    double endValue = linearGauge.getEnd;
    double startValue = linearGauge.getStart;

    //  width of the value bar in pixels based on the value
    double valueBarWidth =
        ((value - startValue) / (endValue - startValue)) * totalWidth;

    /// Enable the animation for value bar
    valueBarWidth = linearGauge.getAnimationValue != null
        ? valueBarWidth * linearGauge.getAnimationValue!
        : valueBarWidth;

    final ValueBarPosition valueBarPosition = position;
    final getLinearGaugeBoxDecoration = linearGauge.getLinearGaugeBoxDecoration;
    final Paint linearGaugeContainerPaint = Paint();
    linearGaugeContainerPaint.color = color;

    //For get Offset Height
    double height = linearGauge.getLinearGaugeBoxDecoration.height;
    double totalValOffset = _getOffsetHeight(valueBarPosition, height, offset);

    // Drawing Value Bar
    final gaugeContainer = Rect.fromLTWH(start, totalValOffset, valueBarWidth,
        getLinearGaugeBoxDecoration.height);
    canvas.drawRect(gaugeContainer, linearGaugeContainerPaint);
  }

  // Calculating Offset Height for Value Bar
  double _getOffsetHeight(
      ValueBarPosition position, double height, double valueBarOffset) {
    switch (position) {
      case ValueBarPosition.center:
        return 0.0;
      case ValueBarPosition.top:
        return -(height + valueBarOffset);
      case ValueBarPosition.bottom:
        return height + valueBarOffset;
      default:
        return 0;
    }
  }
}
