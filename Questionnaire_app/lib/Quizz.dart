import 'package:flutter/material.dart';
import 'package:myapp/QuizzData.dart' as quizzData;

class QuizzGamePage extends StatelessWidget {
  final String quizzName;
  final List<Question> questions;

  const QuizzGamePage({
    super.key,
    required this.quizzName,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quizzName),
        titleTextStyle: const TextStyle(fontSize: 28, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 53, 62),
      ),
      body: QuizzContent(questions: questions),
    );
  }
}

class QuizzContent extends StatefulWidget {
  final List<Question> questions;

  QuizzContent({required this.questions});

  @override
  _QuizzContentState createState() => _QuizzContentState();
}

class _QuizzContentState extends State<QuizzContent> {
  int currentQuestionIndex = 0;
  List<String> userResponses = [];

  void selectAnswer(String answer) {
    if (currentQuestionIndex >= widget.questions.length) {
      return;
    }

    final question = widget.questions[currentQuestionIndex];

    if (question is TextQuestion) {
      if (answer == question.correctAnswer) {
        userResponses.add(answer);
      } else {
        // Afficher un message d'erreur
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Mauvaise réponse !'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } else if (question is MultipleChoiceQuestion) {
      if (answer == question.correctAnswer) {
        userResponses.add(answer);
      } else {
        // Afficher un message d'erreur
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Mauvaise réponse !'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } else if (question is ImageQuestion) {
      if (answer == question.correctAnswer) {
        userResponses.add(answer);
      } else {
        // Afficher un message d'erreur
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Mauvaise réponse !'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= widget.questions.length) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Félicitations, vous avez terminé le quizz !',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Retour'),
            ),
          ],
        ),
      );
    }

    final question = widget.questions[currentQuestionIndex];

    if (question is TextQuestion) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.text,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (response) => selectAnswer(response),
            decoration: const InputDecoration(
              hintText: 'Entrez votre réponse',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 166, 0))),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Retour'),
          ),
        ],
      );
    } else if (question is MultipleChoiceQuestion) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.text,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Column(
            children: question.choices.map((choice) {
              return ElevatedButton(
                onPressed: () {
                  selectAnswer(choice);
                },
                child: Text(choice),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Retour'),
          ),
        ],
      );
    } else if (question is ImageQuestion) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            question.imagePath,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          Column(
            children: question.choices.map((choice) {
              return ElevatedButton(
                onPressed: () {
                  selectAnswer(choice);
                },
                child: Text(choice),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Retour'),
          ),
        ],
      );
    }

    return Container();
  }
}

class Quizz {
  final String name;
  final List<Question> questions;

  Quizz({required this.name, required this.questions});
}

abstract class Question {}

class TextQuestion extends Question {
  final String text;
  final String correctAnswer;

  TextQuestion(this.text, this.correctAnswer);
}

class MultipleChoiceQuestion extends Question {
  final String text;
  final List<String> choices;
  final String correctAnswer;

  MultipleChoiceQuestion(this.text, this.choices, this.correctAnswer);
}

class ImageQuestion extends Question {
  final String imagePath;
  final List<String> choices;
  final String correctAnswer;

  ImageQuestion(this.imagePath, this.choices, this.correctAnswer);
}
