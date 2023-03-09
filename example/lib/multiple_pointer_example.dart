import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/gauges.dart';

class MultiplePointerExample extends StatefulWidget {
  const MultiplePointerExample({super.key});

  @override
  State<MultiplePointerExample> createState() => _MultiplePointerExampleState();
}

class _MultiplePointerExampleState extends State<MultiplePointerExample> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LinearGauge(
          rulers: RulerStyle(
              inverseRulers: false, rulerPosition: RulerPosition.top),
          pointers: [
            Pointer(
              value: 25,
              showLabel: true,
              width: 20,
              height: 120,
              quarterTurns: QuarterTurns.one,
              labelStyle: TextStyle(color: Colors.red),
              color: Colors.blue,
              // quarterTurns: QuarterTurns.three
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 28,
              width: 20,
              height: 120,
              showLabel: true,
              quarterTurns: QuarterTurns.two,
              labelStyle: TextStyle(color: Colors.green),
              color: Color(0xff624CAB),
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 48,
              width: 20,
              height: 120,
              showLabel: true,
              quarterTurns: QuarterTurns.two,
              labelStyle: TextStyle(color: Colors.green),
              color: Color(0xff45CB85),
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 38,
              width: 20,
              height: 50,
              showLabel: true,
              labelStyle: TextStyle(color: Colors.green),
              color: Colors.red,
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 18,
              width: 20,
              showLabel: true,
              labelStyle: TextStyle(color: Colors.red),
              color: Color(0xffFFFF82),
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 8,
              width: 20,
              height: 70,
              showLabel: true,
              labelStyle: TextStyle(color: Colors.red),
              color: Color(0xffD64933),
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 68,
              width: 20,
              height: 45,
              showLabel: true,
              labelStyle: TextStyle(color: Colors.red),
              color: Color(0xffB5FFE9),
              // shape: PointerShape.circle,
            ),
            Pointer(
              value: 78,
              width: 20,
              height: 100,
              showLabel: true,
              labelStyle: TextStyle(color: Colors.red),
              color: Colors.red,
              // shape: PointerShape.circle,
            ),
          ],
        ),
      ),
    );
  }
}
