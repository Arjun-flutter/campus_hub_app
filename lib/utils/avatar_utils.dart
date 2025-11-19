import 'package:flutter/material.dart';

Color avatarFromName(String name) {
  if (name.isEmpty) return Colors.blue;
  int hash = name.codeUnits.fold(0, (p, c) => p + c * 37);
  final r = (hash * 7) % 155 + 80;
  final g = (hash * 5) % 155 + 80;
  final b = (hash * 3) % 155 + 80;
  return Color.fromARGB(255, r, g, b);
}

List<Color> avatarGradient(String name) {
  final c1 = avatarFromName(name);
  final shift = (name.length * 23) % 100;
  final c2 = Color.fromARGB(
    255,
    (c1.red + shift) % 255,
    (c1.green + shift * 2) % 255,
    (c1.blue + shift * 3) % 255,
  );
  return [c1, c2];
}
