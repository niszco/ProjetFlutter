import 'package:flutter/material.dart';

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage(
      {super.key, required Null Function() onReturnPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DefaultTextStyle(
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontFamily: 'CoffeeCake',
          ),
          child: Text('Quizz App !'),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 53, 62),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Félicitations, vous avez terminé le quizz !',
            style: TextStyle(
                fontSize: 46,
                color: Color.fromARGB(255, 0, 53, 62),
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
                color: Color.fromARGB(255, 0, 53, 62),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
