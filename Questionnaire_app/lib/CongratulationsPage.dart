import 'package:flutter/material.dart';

class CongratulationsPage extends StatelessWidget {
  final VoidCallback onReturnPressed;

  CongratulationsPage({super.key, required this.onReturnPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DefaultTextStyle(
          style: TextStyle(
            fontSize: 40,
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'CoffeeCake',
          ),
          child: Text('Quizz App !'),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Félicitations, vous avez terminé le quizz !',
            style: TextStyle(
                fontSize: 46,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
            child: const Text(
              'Retour',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
