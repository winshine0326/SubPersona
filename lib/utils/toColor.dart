import 'package:flutter/material.dart';

extension HexColor on String {
  Color toColor() {
    final hex = replaceAll('#', '');
    final buffer = StringBuffer();
    if (hex.length == 6) buffer.write('FF');
    buffer.write(hex);
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}