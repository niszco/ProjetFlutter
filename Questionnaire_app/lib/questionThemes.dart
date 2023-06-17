import 'package:flutter/material.dart';

final List<LinearGradient> questionThemes = [
  const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromARGB(255, 0, 17, 92),
        Colors.lightBlueAccent,
        Color.fromARGB(255, 99, 41, 235),
        Color.fromARGB(255, 0, 140, 255)
      ]), // Couleur pour le premier questionnaire
  const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromARGB(255, 67, 38, 117),
        Colors.pinkAccent,
        Color.fromARGB(255, 129, 76, 228),
        Color.fromARGB(255, 224, 56, 78)
      ]), // Couleur pour le deuxième questionnaire
  const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromARGB(255, 124, 90, 17),
        Color.fromARGB(255, 255, 161, 54),
        Color.fromARGB(255, 228, 100, 26),
        Color.fromARGB(255, 255, 238, 0)
      ]), // Couleur pour le troisième questionnaire
];
