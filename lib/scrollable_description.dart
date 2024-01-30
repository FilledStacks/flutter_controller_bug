import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollableDescription {
  final Axis axis;
  final Rect rect;
  final double scrollExtentByPixels;
  final double maxScrollExtentByPixels;
  final bool nested;

  ScrollableDescription({
    required this.axis,
    required this.rect,
    required this.scrollExtentByPixels,
    required this.maxScrollExtentByPixels,
    this.nested = false,
  });

  @override
  String toString() {
    return 'Scrollable at $rect with current offset $scrollExtentByPixels';
  }
}
