import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:geekyants_flutter_gauges/linear_gauge/linear_gauge_label.dart';

class RenderLinearGauge extends RenderBox {
  RenderLinearGauge({
    required double start,
    required double end,
    required double steps,
    required bool showLinearGaugeContainer,
    required GaugeOrientation gaugeOrientation,
    required TextStyle textStyle,
    required double primaryRulersWidth,
    required double primaryRulersHeight,
    required double secondaryRulersHeight,
    required double secondaryRulersWidth,
    required double labelTopMargin,
    required Color primaryRulerColor,
    required Color secondaryRulerColor,
    required LinearGaugeBoxDecoration linearGaugeBoxDecoration,
    required double secondaryRulerPerInterval,
    required Color linearGaugeContainerBgColor,
    required Color linearGaugeContainerValueColor,
    required bool showLabel,
    required RulerPosition rulerPosition,
    required double labelOffset,
    required bool showSecondaryRulers,
    required bool showPrimaryRulers,
    required double value,
    required List<RangeLinearGauge> rangeLinearGauge,
    required List<CustomRulerLabel> customLabels,
    required double rulersOffset,
    required ValueBarPosition valueBarPosition,
    required List<ValueBar> valueBar,
    required bool inversedRulers,
    required List<Pointer> pointers,
    required double? animationValue,
    required double thickness,
    required double extendLinearGauge,
  })  : assert(start < end, "Start should be grater then end"),
        _start = start,
        _end = end,
        _steps = steps,
        _showLinearGaugeContainer = showLinearGaugeContainer,
        _gaugeOrientation = gaugeOrientation,
        _textStyle = textStyle,
        _primaryRulerColor = primaryRulerColor,
        _primaryRulersWidth = primaryRulersWidth,
        _primaryRulersHeight = primaryRulersHeight,
        _secondaryRulerColor = secondaryRulerColor,
        _secondaryRulersHeight = secondaryRulersHeight,
        _secondaryRulersWidth = secondaryRulersWidth,
        _labelTopMargin = labelTopMargin,
        _linearGaugeBoxDecoration = linearGaugeBoxDecoration,
        _secondaryRulerPerInterval = secondaryRulerPerInterval,
        _linearGaugeContainerBgColor = linearGaugeBoxDecoration.backgroundColor,
        _linearGaugeContainerValueColor = linearGaugeContainerValueColor,
        _showLabel = showLabel,
        _rulerPosition = rulerPosition,
        _labelOffset = labelOffset,
        _showSecondaryRulers = showSecondaryRulers,
        _showPrimaryRulers = showPrimaryRulers,
        _value = value,
        _rangeLinearGauge = rangeLinearGauge,
        _customLabels = customLabels,
        _rulersOffset = rulersOffset,
        _inversedRulers = inversedRulers,
        _valueBarPosition = valueBarPosition,
        _valueBar = valueBar,
        _pointers = pointers,
        _animationValue = animationValue,
        _thickness = thickness,
        _extendLinearGauge = extendLinearGauge;

  // For getting Gauge Values
  double gaugeStart = 0;
  double gaugeEnd = 0;

  ///
  /// Getter and Setter for the [_animationValue] parameter.
  ///
  double? get getAnimationValue => _animationValue;
  double? _animationValue;
  set setAnimationValue(double? animationValue) {
    if (_animationValue == animationValue) return;
    _animationValue = animationValue;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_start] parameter.
  ///
  double get getStart => _start;
  double _start;
  set setStart(double start) {
    if (_start == start) return;
    _start = start;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_end] parameter.
  ///
  get getEnd => _end;
  double _end;
  set setEnd(end) {
    if (_end == end) return;
    _end = end;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_steps] parameter.
  ///
  get getSteps => _steps;
  double _steps;
  set setSteps(steps) {
    if (_steps == steps) return;

    _steps = steps;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_showLinearGaugeContainer] parameter.
  ///
  get getShowLinearGaugeContainer => _showLinearGaugeContainer;
  bool _showLinearGaugeContainer;
  set setShowLinearGaugeContainer(showLinearGaugeContainer) {
    if (_showLinearGaugeContainer == showLinearGaugeContainer) return;

    _showLinearGaugeContainer = showLinearGaugeContainer;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [gaugeOrientation] parameter.
  ///
  get getGaugeOrientation => _gaugeOrientation;
  GaugeOrientation _gaugeOrientation;

  set setGaugeOrientation(gaugeOrientation) {
    if (_gaugeOrientation == gaugeOrientation) return;

    _gaugeOrientation = gaugeOrientation;
    markNeedsLayout();
  }

  ///
  /// Getter and Setter for the [_textStyle] parameter.
  ///
  get getTextStyle => _textStyle;
  TextStyle _textStyle;
  set setTextStyle(textStyle) {
    if (_textStyle == textStyle) return;

    _textStyle = textStyle;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_primaryRulersWidth] parameter.
  ///
  get getPrimaryRulersWidth => _primaryRulersWidth;
  double _primaryRulersWidth;
  set setPrimaryRulersWidth(primaryRulersWidth) {
    if (_primaryRulersWidth == primaryRulersWidth) return;

    _primaryRulersWidth = primaryRulersWidth;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_primaryRulersHeight] parameter.
  ///
  get getPrimaryRulersHeight => _primaryRulersHeight;

  double _primaryRulersHeight;

  set setPrimaryRulersHeight(primaryRulersHeight) {
    if (_primaryRulersHeight == primaryRulersHeight) return;

    _primaryRulersHeight = primaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_secondaryRulersHeight] parameter.
  ///

  get getSecondaryRulersHeight => _secondaryRulersHeight;

  double _secondaryRulersHeight;

  set setSecondaryRulersHeight(secondaryRulersHeight) {
    if (_secondaryRulersHeight == secondaryRulersHeight) return;

    _secondaryRulersHeight = secondaryRulersHeight;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_secondaryRulersWidth] parameter.
  ///
  get getSecondaryRulersWidth => _secondaryRulersWidth;
  double _secondaryRulersWidth;
  set setSecondaryRulersWidth(secondaryRulersWidth) {
    if (_secondaryRulersWidth == secondaryRulersWidth) return;

    _secondaryRulersWidth = secondaryRulersWidth;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [labelTopMargin] parameter.
  ///
  get getLabelTopMargin => _labelTopMargin;
  double _labelTopMargin;

  set setLabelTopMargin(labelTopMargin) {
    if (_labelTopMargin == labelTopMargin) return;

    _labelTopMargin = labelTopMargin;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_primaryRulerColor] parameter.
  ///
  Color get getPrimaryRulerColor => _primaryRulerColor;
  Color _primaryRulerColor;

  set setPrimaryRulerColor(primaryRulerColor) {
    if (_primaryRulerColor == primaryRulerColor) return;
    _primaryRulerColor = primaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [secondaryRulerColor] parameter.
  ///
  Color get getSecondaryRulerColor => _secondaryRulerColor;
  Color _secondaryRulerColor;

  set setSecondaryRulerColor(secondaryRulerColor) {
    if (_secondaryRulerColor == secondaryRulerColor) return;
    _secondaryRulerColor = secondaryRulerColor;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [linearGaugeBoxDecoration] parameter.
  ///
  LinearGaugeBoxDecoration get getLinearGaugeBoxDecoration =>
      _linearGaugeBoxDecoration;

  LinearGaugeBoxDecoration _linearGaugeBoxDecoration;
  set setLinearGaugeBoxDecoration(linearGaugeBoxDecoration) {
    if (_linearGaugeBoxDecoration == linearGaugeBoxDecoration) return;
    _linearGaugeBoxDecoration = linearGaugeBoxDecoration;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [SecondaryRulerPerInterval] parameter.
  ///
  double get getSecondaryRulerPerInterval => _secondaryRulerPerInterval;
  double _secondaryRulerPerInterval;

  set setSecondaryRulerPerInterval(secondaryRulerPerInterval) {
    if (_secondaryRulerPerInterval == secondaryRulerPerInterval) {
      return;
    }
    _secondaryRulerPerInterval = secondaryRulerPerInterval;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [LinearGaugeContainerBgColor] parameter.
  ///
  Color get getLinearGaugeContainerBgColor => _linearGaugeContainerBgColor;
  Color _linearGaugeContainerBgColor;
  set setLinearGaugeContainerBgColor(Color linearGaugeContainerBgColor) {
    if (_linearGaugeContainerBgColor == linearGaugeContainerBgColor) {
      return;
    }
    _linearGaugeContainerBgColor = linearGaugeContainerBgColor;
    markNeedsPaint();
  }

  Color get getLinearGaugeContainerValueColor =>
      _linearGaugeContainerValueColor;
  Color _linearGaugeContainerValueColor;
  set setLinearGaugeContainerValueColor(Color linearGaugeContainerValueColor) {
    if (_linearGaugeContainerValueColor == linearGaugeContainerValueColor) {
      return;
    }
    _linearGaugeContainerValueColor = linearGaugeContainerValueColor;
    markNeedsPaint();
  }

  double get getValue => _value;
  double _value;
  set setValue(double val) {
    if (_value == val) {
      return;
    }
    _value = val;
    markNeedsPaint();
  }

  bool get showLabel => _showLabel;
  bool _showLabel;
  set setShowLabel(bool val) {
    if (_showLabel == val) return;
    _showLabel = val;
    markNeedsPaint();
  }

  RulerPosition get rulerPosition => _rulerPosition;
  RulerPosition _rulerPosition;
  set setRulerPosition(RulerPosition val) {
    if (_rulerPosition == val) return;
    _rulerPosition = val;
    markNeedsPaint();
  }

  double get getLabelOffset => _labelOffset;
  double _labelOffset;
  set setLabelOffset(double val) {
    if (_labelOffset == val) return;
    _labelOffset = val;
    markNeedsPaint();
  }

  bool get showSecondaryRulers => _showSecondaryRulers;
  bool _showSecondaryRulers;
  set setShowSecondaryRulers(bool val) {
    if (_showSecondaryRulers == val) return;
    _showSecondaryRulers = val;
    markNeedsPaint();
  }

  bool get showPrimaryRulers => _showPrimaryRulers;
  bool _showPrimaryRulers;
  set setShowPrimaryRulers(bool val) {
    if (_showPrimaryRulers == val) return;
    _showPrimaryRulers = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [rangeLinearGauge] parameter.
  ///
  List<RangeLinearGauge>? get rangeLinearGauge => _rangeLinearGauge;
  List<RangeLinearGauge>? _rangeLinearGauge = <RangeLinearGauge>[];
  set setRangeLinearGauge(List<RangeLinearGauge>? val) {
    if (_rangeLinearGauge == val) return;
    _rangeLinearGauge = val;
    markNeedsPaint();
  }

  List<CustomRulerLabel>? get getCustomLabels => _customLabels;
  List<CustomRulerLabel>? _customLabels = <CustomRulerLabel>[];
  set setCustomLabels(List<CustomRulerLabel>? val) {
    if (_customLabels == val) return;
    _customLabels = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [rulersOffset] parameter.
  ///

  double get getRulersOffset => _rulersOffset;
  double _rulersOffset;
  set setRulersOffset(double val) {
    if (_rulersOffset == val) return;
    _rulersOffset = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [inversedRulers] parameter.
  ///

  bool get getInversedRulers => _inversedRulers;
  bool _inversedRulers;
  set setInversedRulers(bool val) {
    if (_inversedRulers == val) return;
    _inversedRulers = val;
    markNeedsPaint();
  }

  LinearGaugeLabel get getLinearGaugeLabel {
    return _linearGaugeLabel;
  }

  ///
  /// Getter and Setter for the [valueBarPosition] parameter.
  ///
  ValueBarPosition get valueBarPosition => _valueBarPosition;
  ValueBarPosition _valueBarPosition;
  set setValueBarPosition(ValueBarPosition val) {
    if (_valueBarPosition == val) return;
    _valueBarPosition = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [valueBar] parameter.
  ///
  List<ValueBar> get getValueBar => _valueBar;
  List<ValueBar> _valueBar = <ValueBar>[];
  set setValueBar(List<ValueBar> val) {
    if (_valueBar == val) return;
    _valueBar = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [Pointer] parameter.
  ///
  List<Pointer> get getPointers => _pointers;
  List<Pointer> _pointers = <Pointer>[];
  set setPointers(List<Pointer> val) {
    if (_pointers == val) return;
    _pointers = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [thickness] parameter.
  ///
  double get getThickness => _thickness;
  double _thickness;
  set setThickness(double val) {
    if (_thickness == val) return;
    _thickness = val;
    markNeedsPaint();
  }

  ///
  /// Getter and Setter for the [_extendLinearGauge] parameter.
  ///
  double get getExtendLinearGauge => _extendLinearGauge;
  double _extendLinearGauge;
  set setExtendLinearGauge(double val) {
    if (_extendLinearGauge == val) return;
    _extendLinearGauge = val;
    markNeedsPaint();
  }

  final Paint _linearGaugeContainerPaint = Paint();
  final Paint _primaryRulersPaint = Paint();
  final Paint _secondaryRulersPaint = Paint();
  final Paint _linearGaugeContainerValuePaint = Paint();
  final LinearGaugeLabel _linearGaugeLabel = LinearGaugeLabel();

  late Size _startLabelSize, _endLabelSize;

  double _valueInPixel = 0;

  void _calculateRulerPoints() {
    if (getCustomLabels!.isEmpty) {
      double screenSize = getGaugeOrientation == GaugeOrientation.horizontal
          ? 3 * size.width
          : 3 * size.height;
      final double count = math.max(screenSize / 100, 1.0);
      double interval = (getEnd - getStart) / (screenSize / 100);
      final List<double> intervalDivisions = <double>[10, 5, 2, 1];
      late double currentInterval;
      num v = math.pow(10, (math.log(interval) / math.log(10)).floor());

      for (final double intervalDivision in intervalDivisions) {
        currentInterval = v * intervalDivision;

        if (count < ((getEnd - getStart) / currentInterval)) {
          break;
        }
        interval = currentInterval;
      }

      _linearGaugeLabel.addLabels(
        distanceValueInRangeOfHundred: getSteps == 0.0 ? interval : getSteps,
        start: getStart,
        end: getEnd,
      );
    } else {
      _start = getCustomLabels!.first.value!;
      _end = getCustomLabels!.last.value!;
      _linearGaugeLabel.addCustomLabels(labelList: getCustomLabels!);
    }

    _startLabelSize = _linearGaugeLabel.getLabelSize(
        textStyle: getTextStyle,
        value: !getInversedRulers
            ? getCustomLabels!.isEmpty
                ? getStart.toInt().toString()
                : getCustomLabels!.first.text
            : getCustomLabels!.isEmpty
                ? getEnd.toInt().toString()
                : getCustomLabels!.last.text);

    _endLabelSize = _linearGaugeLabel.getLabelSize(
        textStyle: getTextStyle,
        value: !getInversedRulers
            ? getCustomLabels!.isEmpty
                ? getEnd.toInt().toString()
                : getCustomLabels!.last.text
            : getCustomLabels!.isEmpty
                ? getStart.toInt().toString()
                : getCustomLabels!.first.text);

    _linearGaugeLabel.generateOffSetsForLabel(
        _startLabelSize,
        _endLabelSize,
        size,
        getEnd,
        getPrimaryRulersHeight,
        getThickness,
        getLabelTopMargin,
        getCustomLabels!.isNotEmpty,
        getInversedRulers,
        getGaugeOrientation,
        getExtendLinearGauge,
        this);
  }

  void _drawLabels(
    Canvas canvas,
    String text,
    double? value,
    List<Offset> list,
  ) {
    final ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );

    // calculator method to get the text style based on the range
    Color getRangeColor(String text) {
      for (int i = 0; i < rangeLinearGauge!.length; i++) {
        if (value! >= rangeLinearGauge![i].start &&
            value <= rangeLinearGauge![i].end) {
          return rangeLinearGauge![i].color;
        }
      }
      // Return a default style if no range color is found
      return getTextStyle.color;
    }

    final ui.TextStyle labelTextStyle = ui.TextStyle(
      // color: getTextStyle.color,
      color: getRangeColor(text),
      fontSize: getTextStyle.fontSize,
      background: getTextStyle.background,
      decoration: getTextStyle.decoration,
      decorationColor: getTextStyle.decorationColor,
      decorationStyle: getTextStyle.decorationStyle,
      decorationThickness: getTextStyle.decorationThickness,
      fontFamily: getTextStyle.fontFamily,
      fontFamilyFallback: getTextStyle.fontFamilyFallback,
      fontFeatures: getTextStyle.fontFeatures,
      fontStyle: getTextStyle.fontStyle,
      fontVariations: getTextStyle.fontVariations,
      fontWeight: getTextStyle.fontWeight,
      foreground: getTextStyle.foreground,
      height: getTextStyle.height,
      leadingDistribution: getTextStyle.leadingDistribution,
      letterSpacing: getTextStyle.letterSpacing,
      locale: getTextStyle.locale,
      shadows: getTextStyle.shadows,
      textBaseline: getTextStyle.textBaseline,
      wordSpacing: getTextStyle.wordSpacing,
    );

    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(labelTextStyle)
          ..addText(text);
    final ui.Paragraph paragraph = paragraphBuilder.build();
    final Size labelSize =
        _linearGaugeLabel.getLabelSize(textStyle: getTextStyle, value: text);

    paragraph.layout(ui.ParagraphConstraints(width: labelSize.width));

    // offset for drawing the label on the canvas
    Offset labelPosition;

    switch (rulerPosition) {
      case RulerPosition.top:
        labelPosition = Offset(
          (list[0].dx - (labelSize.width / 2)),
          -(getPrimaryRulersHeight +
              getLabelOffset +
              getRulersOffset +
              labelSize.height +
              2),
        );
        break;
      case RulerPosition.center:
        if (getGaugeOrientation == GaugeOrientation.horizontal) {
          double labelOffset =
              (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
          labelPosition = Offset(
            (list[0].dx - (labelSize.width / 2)),
            (list[0].dy / 2 + getPrimaryRulersHeight / 2 + labelOffset),
          );
        } else {
          double labelOffset =
              (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
          labelPosition = Offset(
            (list[0].dx / 2 + getPrimaryRulersHeight / 2 + labelOffset),
            (list[0].dy - (labelSize.height / 2)),
          );
        }
        break;
      case RulerPosition.bottom:
        double labelOffset =
            (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
        labelPosition = Offset(
          (list[0].dx - (labelSize.width / 2)),
          (list[0].dy + getPrimaryRulersHeight + labelOffset + getRulersOffset),
        );
        break;
      case RulerPosition.right:
        double labelOffset =
            (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
        labelPosition = Offset(
          (list[0].dx +
              (getPrimaryRulersHeight + labelOffset + getRulersOffset)),
          (list[0].dy - (labelSize.height / 2)),
        );
        break;
      case RulerPosition.left:
        double labelOffset =
            (getLabelTopMargin == 0.0) ? getLabelOffset : getLabelTopMargin;
        labelPosition = Offset(
          -(getPrimaryRulersHeight +
              labelOffset +
              getRulersOffset +
              labelSize.width),
          (list[0].dy - (labelSize.height / 2)),
        );
        break;
    }

    canvas.drawParagraph(
      paragraph,
      labelPosition,
    );
  }

  void _paintGaugeContainer(Canvas canvas, Size size) {
    if (rangeLinearGauge!.isNotEmpty) {
      assert(rangeLinearGauge!.last.end <= getEnd,
          'The end value of the range should be less than the end value of the gauge.');
      assert(rangeLinearGauge!.first.start >= getStart,
          'The start value of the range should be less than the start value of the gauge.');
    }

    Offset offset = const Offset(0, 0);
    late double end;
    late double start;

    double largestPointerWidth = getLargestPointerSize();

    if (showLabel) {
      end = GaugeOrientation.horizontal == getGaugeOrientation
          ? size.width -
              ((_endLabelSize.width / 2) +
                  (_startLabelSize.width / 2) +
                  (largestPointerWidth))
          : (size.height -
              ((_endLabelSize.height / 2) +
                  (_startLabelSize.height / 2) +
                  (largestPointerWidth)));

      start = GaugeOrientation.horizontal == getGaugeOrientation
          ? (offset.dx +
              (_startLabelSize.width / 2) +
              (largestPointerWidth / 2))
          : (offset.dx +
              (_startLabelSize.height / 2) +
              (largestPointerWidth / 2));
    } else {
      end = GaugeOrientation.horizontal == getGaugeOrientation
          ? size.width - (largestPointerWidth)
          : size.height - (largestPointerWidth);
      start = offset.dx + (largestPointerWidth / 2);
    }

    late Rect gaugeContainer;
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      gaugeContainer = Rect.fromLTWH(
        start,
        offset.dy,
        end,
        getThickness,
      );
    } else {
      gaugeContainer = Rect.fromLTWH(
        offset.dy,
        start,
        getThickness,
        end,
      );
    }

    double totalWidth = end;
    double totalValOnPixel;

    if (getValue < getStart) {
      totalValOnPixel = 0.0;
    } else {
      totalValOnPixel =
          (((getValue) - getStart) / (getEnd - getStart)) * totalWidth;

      totalValOnPixel = getAnimationValue != null
          ? totalValOnPixel * getAnimationValue!
          : totalValOnPixel;
    }

    gaugeStart = start;
    gaugeEnd = end;

    if (getLinearGaugeBoxDecoration.borderRadius != null) {
      var rectangularBox = _getRoundedContainer(gaugeContainer: gaugeContainer);
      canvas.drawRRect(rectangularBox, _linearGaugeContainerPaint);

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;

      if (getGaugeOrientation == GaugeOrientation.horizontal) {
        gaugeContainer = Rect.fromLTWH(
          !getInversedRulers ? start : (start + end),
          offset.dy,
          !getInversedRulers ? totalValOnPixel : -totalValOnPixel,
          getThickness,
        );
      } else {
        gaugeContainer = Rect.fromLTWH(
          offset.dy,
          !getInversedRulers ? (start + end) : start,
          getThickness,
          !getInversedRulers ? -totalValOnPixel : totalValOnPixel,
        );
      }

      if (getLinearGaugeBoxDecoration.linearGradient != null) {
        _linearGaugeContainerValuePaint.shader = getLinearGaugeBoxDecoration
            .linearGradient!
            .createShader(gaugeContainer);
      }
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
        ),
        _linearGaugeContainerValuePaint,
      );

      _drawValueBars(
        canvas: canvas,
        start: start,
        totalWidth: totalWidth,
        end: end,
      );
      _drawRangeBars(
        start: start,
        end: end,
        canvas: canvas,
        totalWidth: totalWidth,
        gaugeContainer: gaugeContainer,
        offset: offset,
      );
    } else {
      canvas.drawRect(gaugeContainer, _linearGaugeContainerPaint);

      _linearGaugeContainerValuePaint.color = getLinearGaugeContainerValueColor;
      if (getGaugeOrientation == GaugeOrientation.horizontal) {
        gaugeContainer = Rect.fromLTWH(
          !getInversedRulers ? start : (start + end),
          offset.dy,
          !getInversedRulers ? totalValOnPixel : -totalValOnPixel,
          getThickness,
        );
      } else {
        gaugeContainer = Rect.fromLTWH(
          offset.dy,
          !getInversedRulers ? (start + end) : start,
          getThickness,
          !getInversedRulers ? -totalValOnPixel : totalValOnPixel,
        );
      }

      if (getLinearGaugeBoxDecoration.linearGradient != null) {
        _linearGaugeContainerValuePaint.shader = getLinearGaugeBoxDecoration
            .linearGradient!
            .createShader(gaugeContainer);
      }

      // Draw the value bar in the gauge container for @deprecated value
      canvas.drawRect(
        gaugeContainer,
        _linearGaugeContainerValuePaint,
      );

      _drawValueBars(
        canvas: canvas,
        start: start,
        totalWidth: totalWidth,
        end: end,
      );
      _drawRangeBars(
        start: start,
        end: end,
        canvas: canvas,
        totalWidth: totalWidth,
        gaugeContainer: gaugeContainer,
        offset: offset,
      );
    }
  }

  void _drawValueBars(
      {required Canvas canvas,
      required double start,
      required double end,
      required double totalWidth}) {
    // For loop for drawing value bar in [LinearGauge]
    for (int j = 0; j < getValueBar.length; j++) {
      getValueBar[j].drawValueBar(
        canvas,
        start,
        end,
        totalWidth,
        this,
      );
    }
  }

  void _drawRangeBars({
    required Canvas canvas,
    required double start,
    required double end,
    required double totalWidth,
    required Offset offset,
    required Rect gaugeContainer,
  }) {
    /// For loop for calculating colors in [RangeLinearGauge]
    /// 2 is hardcoded beacuse extend is happeing from both the end of the gauge
    for (int i = 0; i < rangeLinearGauge!.length; i++) {
      // Method to cal exact width
      double calculateValuePixelWidth(double value) {
        return ((value - getStart) / (getEnd - getStart)) *
            (totalWidth - 2 * getExtendLinearGauge);
      }

      // width of the colorRange
      double colorRangeWidth =
          calculateValuePixelWidth(rangeLinearGauge![i].end) -
              calculateValuePixelWidth(rangeLinearGauge![i].start);

      // Start of the ColorRange

      double colorRangeStart;
      if (getGaugeOrientation == GaugeOrientation.horizontal) {
        colorRangeStart = !getInversedRulers
            ? (calculateValuePixelWidth(rangeLinearGauge![i].start) +
                start +
                getExtendLinearGauge)
            : ((start + end) -
                calculateValuePixelWidth(rangeLinearGauge![i].start) -
                getExtendLinearGauge);

        if (i == 0 && rangeLinearGauge!.first.start == getStart) {
          if (!getInversedRulers) {
            colorRangeStart = colorRangeStart - getExtendLinearGauge;
            colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
          } else {
            colorRangeStart = colorRangeStart + getExtendLinearGauge;
            colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
          }
        }

        gaugeContainer = Rect.fromLTWH(
          colorRangeStart,
          offset.dy,
          !getInversedRulers ? colorRangeWidth : -colorRangeWidth,
          getThickness,
        );
      } else {
        colorRangeStart = !getInversedRulers
            ? ((start + end) -
                calculateValuePixelWidth(rangeLinearGauge![i].start) -
                getExtendLinearGauge)
            : (calculateValuePixelWidth(rangeLinearGauge![i].start) +
                start +
                getExtendLinearGauge);

        if (i == 0 && rangeLinearGauge!.first.start == getStart) {
          if (!getInversedRulers) {
            colorRangeStart = colorRangeStart + getExtendLinearGauge;
            colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
          } else {
            colorRangeStart = colorRangeStart - getExtendLinearGauge;
            colorRangeWidth = colorRangeWidth + getExtendLinearGauge;
          }
        }
        gaugeContainer = Rect.fromLTWH(
          offset.dy,
          colorRangeStart,
          getThickness,
          !getInversedRulers ? -colorRangeWidth : colorRangeWidth,
        );
      }

      _linearGaugeContainerValuePaint.color = rangeLinearGauge![i].color;
      canvas.drawRect(
        gaugeContainer,
        _linearGaugeContainerValuePaint,
      );
    }
  }

  RRect _getRoundedContainer({required Rect gaugeContainer}) {
    var rectangularBox;
    switch (getLinearGaugeBoxDecoration.edgeStyle) {
      case LinearEdgeStyle.startCurve:
        rectangularBox = RRect.fromRectAndCorners(
          gaugeContainer,
          topLeft: Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
          bottomLeft: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.circular(getLinearGaugeBoxDecoration.borderRadius!)
              : Radius.zero,
          topRight: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.zero
              : Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
        );
        break;
      case LinearEdgeStyle.endCurve:
        rectangularBox = RRect.fromRectAndCorners(
          gaugeContainer,
          topRight: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.circular(getLinearGaugeBoxDecoration.borderRadius!)
              : Radius.zero,
          bottomLeft: (getGaugeOrientation == GaugeOrientation.horizontal)
              ? Radius.zero
              : Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
          bottomRight:
              Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
        );
        break;

      default:
        rectangularBox = RRect.fromRectAndRadius(
          gaugeContainer,
          Radius.circular(getLinearGaugeBoxDecoration.borderRadius!),
        );
        break;
    }

    return rectangularBox;
  }

  double getLargestPointerSize() {
    if (getPointers.isNotEmpty) {
      Pointer largestPointer = getPointers.reduce(
          (current, next) => getGaugeOrientation == GaugeOrientation.vertical
              ? current.height! > next.height!
                  ? current
                  : next
              : current.width! > next.width!
                  ? current
                  : next);

      if ((largestPointer.shape == PointerShape.rectangle ||
              largestPointer.shape == PointerShape.diamond) &&
          getGaugeOrientation == GaugeOrientation.vertical) {
        return largestPointer.height!;
      } else {
        return largestPointer.width!;
      }
    } else {
      return 10;
    }
  }

  void _drawPrimaryRulers(Canvas canvas) {
    _setPrimaryRulersPaint();
    int count = 0;

    _linearGaugeLabel.getPrimaryRulersOffset.forEach((key, value) {
      double? y;
      double? x;
      Offset? primaryRulerStartPoint;
      Color? primaryRulerColor = getPrimaryRulerColor;

      for (int i = 0; i < rangeLinearGauge!.length; i++) {
        var range = rangeLinearGauge![i].end;
        var offset = double.parse(key);
        if (offset >= rangeLinearGauge![i].start && offset <= range) {
          primaryRulerColor = rangeLinearGauge![i].color;
          break;
        }
      }

      switch (rulerPosition) {
        case RulerPosition.top:
          //y co-ordinate will be simply inverted on negative side by adding -ve sign
          //no need to adjust y co-ordinate by adding the height of gauge container
          y = -(value[1].dy + getRulersOffset);
          x = value[1].dx;
          primaryRulerStartPoint = Offset(value[0].dx, -getRulersOffset);
          break;
        case RulerPosition.center:
          if (getGaugeOrientation == GaugeOrientation.horizontal) {
            //the y co-ordinate of the ending point is halved from it's original position

            y = (value[1].dy + getThickness) / 2;
            x = value[1].dx;
            //the staring point is shifted half of the primary ruler height from the
            //center of the gauge container
            primaryRulerStartPoint = Offset(
                value[0].dx, value[0].dy / 2 - getPrimaryRulersHeight / 2);
          } else {
            y = value[1].dy;
            x = (value[1].dx + getThickness) / 2;
            primaryRulerStartPoint = Offset(
                value[0].dx / 2 - getPrimaryRulersHeight / 2, value[0].dy);
          }
          break;
        case RulerPosition.bottom:
          //there is need to adjust y co-ordinate by adding the height of gauge container
          //bcz line will start drawing from behind of gauge container
          y = value[1].dy + getThickness + getRulersOffset;
          x = value[1].dx;
          primaryRulerStartPoint =
              Offset(value[0].dx, value[0].dy + getRulersOffset);
          break;
        case RulerPosition.right:
          if (GaugeOrientation.vertical == getGaugeOrientation) {
            y = value[1].dy;
            x = value[1].dx + getThickness + getRulersOffset;
            primaryRulerStartPoint =
                Offset(value[0].dx + getRulersOffset, value[0].dy);
          }

          break;
        case RulerPosition.left:
          if (GaugeOrientation.vertical == getGaugeOrientation) {
            y = value[1].dy;
            x = -(value[1].dx + getRulersOffset);
            primaryRulerStartPoint = Offset(-getRulersOffset, value[0].dy);
          }

          break;
      }

      //the ending point of the primary ruler

      Offset a = Offset(x!, y!);
      _primaryRulersPaint.color = primaryRulerColor!;

      canvas.drawLine(primaryRulerStartPoint!, a, _primaryRulersPaint);
      if (showLabel) {
        _drawLabels(canvas, _linearGaugeLabel.getListOfLabel[count].text!,
            _linearGaugeLabel.getListOfLabel[count].value!, value);
      }
      count++;
    });
  }

  void _drawSecondaryRulers(Canvas canvas) {
    _linearGaugeLabel.generateSecondaryRulers(
        getSecondaryRulerPerInterval,
        canvas,
        _secondaryRulersPaint,
        getSecondaryRulersHeight + getThickness,
        rulerPosition,
        rangeLinearGauge!,
        getRulersOffset,
        getGaugeOrientation,
        getThickness);
  }

  void _setPrimaryRulersPaint() {
    _primaryRulersPaint.color = getPrimaryRulerColor;
    _primaryRulersPaint.strokeWidth = getPrimaryRulersWidth;
  }

  void _setSecondaryRulersPaint() {
    _secondaryRulersPaint.color = getSecondaryRulerColor;
    _secondaryRulersPaint.strokeWidth = getSecondaryRulersWidth;
  }

  void _setLinearGaugeContainerPaint() {
    _linearGaugeContainerPaint.color = getLinearGaugeContainerBgColor;
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = getGaugeOrientation == GaugeOrientation.vertical
        ? constraints.minWidth
        : constraints.maxWidth;
    final desiredHeight = getGaugeOrientation == GaugeOrientation.horizontal
        ? constraints.minHeight
        : constraints.maxHeight;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;

    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    _setLinearGaugeContainerPaint();
    _setSecondaryRulersPaint();

    _calculateRulerPoints();

    if (rulerPosition == RulerPosition.center) {
      if (getShowLinearGaugeContainer) {
        _paintGaugeContainer(canvas, size);
      }
    }

    if (showPrimaryRulers) {
      _drawPrimaryRulers(canvas);
    }

    if (showSecondaryRulers) {
      _drawSecondaryRulers(canvas);
    }

    if (rulerPosition != RulerPosition.center) {
      if (getShowLinearGaugeContainer) {
        _paintGaugeContainer(canvas, size);
      }
    }

    var firstOffset = (!getInversedRulers)
        ? Offset(_valueInPixel, 0.0)
        : -Offset(_valueInPixel, 0.0);

    var firstOff =
        _linearGaugeLabel.getPrimaryRulersOffset[getStart.toString()]![0] +
            firstOffset;

    var verticalFirstOffset =
        _linearGaugeLabel.getPrimaryRulersOffset[getStart.toString()]!;

    Offset vert = verticalFirstOffset.first;
    if (getGaugeOrientation == GaugeOrientation.horizontal) {
      firstOff = vert;
    } else {
      firstOff = vert;
    }
    // Drawing Pointers based on list of pointers added to the gauge
    for (int i = 0; i < getPointers.length; i++) {
      getPointers[i].drawPointer(
        getPointers[i].shape,
        canvas,
        gaugeStart,
        gaugeEnd,
        firstOff,
        this,
      );
    }

    canvas.restore();
  }

  double valueToPixel(double value) {
    final double pixel = ((value - getStart) / (getEnd - getStart)) * gaugeEnd;
    return pixel;
  }
}
