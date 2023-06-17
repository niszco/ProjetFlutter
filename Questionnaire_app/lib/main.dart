import 'package:flutter/material.dart';

import 'QuizzData.dart';
import 'QuizzList.dart';
import 'Quizz.dart' as quizzData;
import 'PagesRoutes.dart';
import 'CongratulationsPage.dart';
import 'questionThemes.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final quizzList = <QuizzList>[
    QuizzList(
      name: 'Culture Geek : Star Wars',
      description:
          'Connais-tu vraiment l\'univers de Star Wars ? À toi de jouer !',
    ),
    QuizzList(
      name: 'Culture G : Espace',
      description:
          'As-tu une bonne culture générale en Astronomie ? Testes tes connaissances maintenant !',
    ),
    QuizzList(
      name: 'Trouve le Pays !',
      description:
          'Trouve le nom des pays correspondant aux drapeaux affichés !',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
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
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                  ),
                  for (int i = 0; i < quizzList.length; i++)
                    Builder(
                      builder: (context) => InkWell(
                        onTap: () {
                          String route = "";
                          if (i == 0) {
                            route = PagesRoutes.quizzStarWars;
                          } else if (i == 1) {
                            route = PagesRoutes.quizzEspace;
                          } else if (i == 2) {
                            route = PagesRoutes.quizzPays;
                          }
                          Navigator.pushNamed(
                            context,
                            route,
                            arguments: quizzList[i].name,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient:
                                  questionThemes[i % questionThemes.length],
                              borderRadius: BorderRadius.circular(90),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  quizzList[i].name,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  quizzList[i].description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(178, 255, 255, 255)),
      initialRoute: PagesRoutes.home,
      routes: {
        PagesRoutes.quizzStarWars: (context) => QuizzGamePage(
              quizzName: "Culture Geek : Star Wars",
              questions: [
                TextQuestion(
                    "Quel est le nom du vaisseau spatial piloté par Han Solo ?",
                    "Faucon Millenium"),
                TextQuestion("Quelle est la planète d'origine de Chewbacca ?",
                    "Kashyyk"),
                TextQuestion("Quel est le nom complet de Dark Vador ?",
                    "Anakin Skywalker"),
              ],
              onQuizzFinished: () {
                Navigator.pushReplacementNamed(
                  context,
                  PagesRoutes.congratulations,
                );
              },
            ),
        PagesRoutes.quizzEspace: (context) => QuizzGamePage(
              quizzName: "Culture G : Espace",
              questions: [
                MultipleChoiceQuestion(
                  "Quelle est la planète la plus proche du Soleil ?",
                  ["Vénus", "Mercure", "Terre", "Mars"],
                  "Mercure",
                ),
                MultipleChoiceQuestion(
                  "Quelle est la plus grande planète du système solaire ?",
                  ["Jupiter", "Saturne", "Uranus", "Neptune"],
                  "Jupiter",
                ),
                MultipleChoiceQuestion(
                  "Quel est l'élément atomique le plus commun dans l'Univers ?",
                  ["Hélium", "Fer", "Oxygène", "Hydrogène"],
                  "Hydrogène",
                ),
                MultipleChoiceQuestion(
                  "Quelle est la plus grande étoile connue dans l'univers ?",
                  ["VY Canis Majoris", "Le Soleil", "Sirius", "Betelgeuse"],
                  "VY Canis Majoris",
                ),
                MultipleChoiceQuestion(
                  "Quelle est la première personne à avoir marché sur la Lune ?",
                  [
                    "Neil Armstrong",
                    "Buzz Aldrin",
                    "Yuri Gagarin",
                    "Alan Shepard"
                  ],
                  "Neil Armstrong",
                ),
              ],
              onQuizzFinished: () {
                Navigator.pushReplacementNamed(
                  context,
                  PagesRoutes.congratulations,
                );
              },
            ),
        PagesRoutes.quizzPays: (context) => QuizzGamePage(
              quizzName: "Trouve le Pays !",
              questions: [
                ImageQuestion(
                  "assets/france.png",
                  ["France", "Espagne", "Italie", "Allemagne"],
                  "France",
                ),
                ImageQuestion(
                  "assets/mexique.png",
                  ["États-Unis", "Canada", "Mexique", "Royaume-Uni"],
                  "Mexique",
                ),
                ImageQuestion(
                  "assets/japon.png",
                  ["Japon", "Chine", "Corée du Sud", "Thaïlande"],
                  "Japon",
                ),
                ImageQuestion(
                  "assets/mongolie.png",
                  ["Kazhakstan", "Ouzbekistan", "Mongolie", "Chine"],
                  "Mongolie",
                ),
                ImageQuestion(
                  "assets/vietnam.png",
                  ["Laos", "Cambodge", "Myanmar", "Vietnam"],
                  "Vietnam",
                ),
                ImageQuestion(
                  "assets/nepal.png",
                  ["Népal", "Inde", "Bangladesh", "Sri-Lanka"],
                  "Népal",
                ),
                ImageQuestion(
                  "assets/islande.png",
                  ["Écosse", "Islande", "Pays de Galle", "Groënland"],
                  "Islande",
                ),
                ImageQuestion(
                  "assets/mozambique.png",
                  ["Zimbabwe", "Angola", "Madagascar", "Mozambique"],
                  "Mozambique",
                ),
              ],
              onQuizzFinished: () {
                Navigator.pushReplacementNamed(
                  context,
                  PagesRoutes.congratulations,
                );
              },
            ),
        PagesRoutes.congratulations: (context) => CongratulationsPage(
              onReturnPressed: () {
                Navigator.pop(context);
              },
            ),
      },
    );
  }
}

class QuizzGamePage extends StatelessWidget {
  final String quizzName;
  final List<Question> questions;

  const QuizzGamePage({
    super.key,
    required this.quizzName,
    required this.questions,
    required VoidCallback onQuizzFinished,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quizzName),
        titleTextStyle: const TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'CoffeeCake'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: QuizzContent(questions: questions),
    );
  }
}

class QuizzContent extends StatefulWidget {
  final List<Question> questions;

  const QuizzContent({super.key, required this.questions});

  @override
  _QuizzContentState createState() => _QuizzContentState();
}

class _QuizzContentState extends State<QuizzContent> {
  int currentQuestionIndex = 0;
  List<String> userResponses = [];
  bool isQuizzFinished = false;
  TextEditingController answerController = TextEditingController();

  void selectAnswer(String answer) {
    final question = widget.questions[currentQuestionIndex];

    if (question is TextQuestion) {
      if (answer.toLowerCase().trim() ==
          question.correctAnswer.toLowerCase().trim()) {
        userResponses.add(answer);
        currentQuestionIndex++;
        answerController.clear();
      }
    } else if (question is MultipleChoiceQuestion ||
        question is ImageQuestion) {
      if ((question as dynamic).correctAnswer.contains(answer)) {
        userResponses.add(answer);
        currentQuestionIndex++;
        answerController.clear();
      }
    }

    if (currentQuestionIndex >= widget.questions.length) {
      isQuizzFinished = true;
      userResponses.clear();
      currentQuestionIndex = 0;

      setState(() {
        isQuizzFinished = true;
        Navigator.pushReplacementNamed(context, PagesRoutes.congratulations);
      });
    } else {
      setState(() {});
    }
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= widget.questions.length) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Text('Retour',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
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
            style: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 0, 53, 62),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: answerController,
            decoration: const InputDecoration(
              hintText: 'Entrez votre réponse',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (response) {
              selectAnswer(response);
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                selectAnswer(answerController.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Text(
                'Valider',
                style: TextStyle(color: Color.fromARGB(255, 0, 53, 62)),
              )),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: const Text(
              'Retour',
              style: TextStyle(color: Color.fromARGB(255, 0, 53, 62)),
            ),
          ),
        ],
      );
    } else if (question is MultipleChoiceQuestion) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.text,
            style: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 0, 53, 62),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: question.choices.map((choice) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  onPressed: () {
                    selectAnswer(choice);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      choice,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 53, 62),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: const Text(
              'Retour',
              style: TextStyle(color: Color.fromARGB(255, 0, 53, 62)),
            ),
          ),
        ],
      );
    } else if (question is ImageQuestion) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            question.imagePath,
            width: 225.0,
            height: 150.0,
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2, // Nombre de colonnes dans la grille
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: question.choices.map((choice) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  onPressed: () {
                    selectAnswer(choice);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      choice,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 53, 62)),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: const Text('Retour',
                style: TextStyle(color: Color.fromARGB(255, 0, 53, 62))),
          ),
        ],
      );
    }

    return Container();
  }
}
