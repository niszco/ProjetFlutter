import 'package:flutter/material.dart';
import 'QuizzData.dart';
import 'QuizzList.dart';
import 'Quizz.dart' as quizzData;
import 'PagesRoutes.dart';

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
          title: const Text('Quizz App !'),
          titleTextStyle: const TextStyle(fontSize: 28, color: Colors.white),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 166, 0),
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
                            horizontal: 30, vertical: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(60, 255, 166, 0),
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: const Color.fromARGB(200, 255, 166, 0),
                            ),
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
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 65, 65, 65),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                quizzList[i].description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 124, 124, 124),
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
      ),
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
                  "Quel est l'élément le plus commun dans l'Univers ?",
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
                  "assets/japan.png",
                  ["Japon", "Chine", "Corée du Sud", "Thaïlande"],
                  "Japon",
                ),
              ],
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
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quizzName),
        titleTextStyle: const TextStyle(fontSize: 28, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 255, 166, 0),
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

  void selectAnswer(String answer) {
    setState(() {
      userResponses.add(answer);
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
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 166, 0),
              ),
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
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 166, 0),
            ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 166, 0),
                ),
                child: Text(choice),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 166, 0),
            ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 166, 0),
                ),
                child: Text(choice),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 166, 0),
            ),
            child: const Text('Retour'),
          ),
        ],
      );
    }
    return Container(); // Retourne un conteneur vide si le type de question n'est pas pris en charge
  }
}
