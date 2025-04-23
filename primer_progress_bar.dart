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
      value: 30,
      label: Text("Dart"),
      valueLabel: Text("38.1%"),
    ),
    Segment(
      color: Color(0xfff34b7d),
      value: 25,
      label: Text("C++"),
      valueLabel: Text("25.5%"),
    ),
    Segment(
      color: Color(0xff555555),
      value: 9,
      label: Text("C"),
      valueLabel: Text("21.0%"),
    ),
    Segment(
      color: Color(0xffda3434),
      value: 6,
      label: Text("CMake"),
      valueLabel: Text("14.17%"),
    ),
    Segment(
      color: Colors.orange,
      value: 1,
      label: Text("Swift"),
      valueLabel: Text("0.4%"),
    ),
    Segment(
      color: Colors.grey,
      value: 2,
      label: Text("Shell"),
      valueLabel: Text("4%"),
    ),
    Segment(
      color: Colors.indigo,
      value: 2,
      label: Text("Java"),
      valueLabel: Text("4%"),
    ),
    Segment(
      color: Colors.red,
      value: 2,
      label: Text("Objective-C"),
      valueLabel: Text("4%"),
    ),
    Segment(
      color: Colors.teal,
      value: 1,
      label: Text("Rust"),
      valueLabel: Text("2%"),
    ),
    Segment(
      color: Colors.brown,
      value: 2,
      label: Text("HTML"),
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
