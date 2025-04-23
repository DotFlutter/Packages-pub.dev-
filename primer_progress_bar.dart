import 'package:flutter/material.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class CustomPrimerProgressBar extends StatefulWidget {
  const CustomPrimerProgressBar({super.key});

  @override
  State<CustomPrimerProgressBar> createState() =>
      _CustomPrimerProgressBarState();
}

class _CustomPrimerProgressBarState extends State<CustomPrimerProgressBar> {
  final segments = const [
    Segment(
      color: Colors.green,
      value: 24,
      label: Text("Dart"),
      valueLabel: Text("24%"),
    ),
    Segment(
      color: Colors.lime,
      value: 11,
      label: Text("CSS"),
      valueLabel: Text("11%"),
    ),
    Segment(
      color: Colors.purple,
      value: 9,
      label: Text("HTML"),
      valueLabel: Text("9%"),
    ),
    Segment(
      color: Colors.lightBlue,
      value: 6,
      label: Text("Typescript"),
      valueLabel: Text("6%"),
    ),
    Segment(
      color: Colors.orange,
      value: 4,
      label: Text("Javascript"),
      valueLabel: Text("4%"),
    ),
    Segment(
      color: Colors.grey,
      value: 4,
      label: Text("Shell"),
      valueLabel: Text("4%"),
    ),
    Segment(
      color: Colors.indigo,
      value: 4,
      label: Text("Java"),
      valueLabel: Text("4%"),
    ),
    Segment(
      color: Colors.red,
      value: 4,
      label: Text("Objective-C"),
      valueLabel: Text("4%"),
    ),
    Segment(
      color: Colors.teal,
      value: 2,
      label: Text("Rust"),
      valueLabel: Text("2%"),
    ),
    Segment(
      color: Colors.brown,
      value: 2,
      label: Text("Swift"),
      valueLabel: Text("2%"),
    ),
  ];

  late final maxTotalValue = segments.fold(0, (acc, seg) => acc + seg.value);

  late int displaySegmentCount = segments.length ~/ 2;
  late double sliderValue = segments.length / 2;
  bool alwaysFillBar = false;
  bool limitLegendLines = false;

  @override
  Widget build(BuildContext context) {
    // Package "PrimerProgressBar"
    return Scaffold(
      body: Center(
        child: PrimerProgressBar(
          segments: segments,
          legendStyle: const SegmentedBarLegendStyle(maxLines: 2),
          legendEllipsisBuilder: (truncatedItemCount) {
            final value = segments
                .skip(segments.length - truncatedItemCount)
                .fold(0, (accValue, segment) => accValue + segment.value);
            return LegendItem(
              segment: Segment(
                value: value,
                color: Colors.grey,
                label: const Text("Other"),
                valueLabel: Text("$value%"),
              ),
            );
          },
        ),
      ),
    );
  }
}
