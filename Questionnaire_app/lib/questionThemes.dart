import 'package:flutter/material.dart';

final List<LinearGradient> questionThemes = [
  const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: <Color>[
        Colors.blue,
        Colors.lightBlueAccent
      ]), // Couleur pour le premier questionnaire
  const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: <Color>[
        Colors.pink,
        Colors.pinkAccent
      ]), // Couleur pour le deuxième questionnaire
  const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: <Color>[
        Colors.green,
        Colors.lightGreenAccent
      ]), // Couleur pour le troisième questionnaire
];
