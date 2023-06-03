import 'package:flutter/material.dart';

void main() => runApp(
      MyApp(),
    );

class PageName {
  static const String home = '/';
  static const String quizz = '/quizz_game_page';
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final quizzList = <QuizzList>[
    // <== liste finale, contenu constant
    QuizzList(
        name: 'Culture Geek : Star Wars',
        description: 'Connais-tu vraiment l\'univers de Star Wars ?'),
    QuizzList(
        name: 'Culture G : Espace',
        description:
            'As-tu une bonne culture générale en Astronomie ? testes tes connaissances maintenant !'),
    QuizzList(
        name: 'Trouve le Pays !',
        description:
            'Trouve le nom des pays correspondant aux drapeaux affichés !')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // <== définit le thème Light
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          // <== définit le thème Dark
          brightness: Brightness.light,
        ),
        themeMode: ThemeMode.dark,
        home: ScaffoldMessenger(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Quizz App !'),
              centerTitle: true,
              backgroundColor: Color.fromARGB(255, 255, 174, 0),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                    ),
                    for (int i = 0; i < quizzList.length; i++)
                      QuizzListChoice(
                        name: quizzList[i].name,
                        description: quizzList[i].description,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        initialRoute: PageName.home,
        routes: {
          PageName.quizz: (context) => const QuizzGamePage(),
        });
  }
}

class QuizzList {
  final String name;
  final String description;

  QuizzList({required this.name, required this.description});
}

class QuizzListChoice extends StatefulWidget {
  const QuizzListChoice({
    Key? key,
    required this.name,
    required this.description,
  }) : super(key: key);

  final String name;
  final String description;

  @override
  State<QuizzListChoice> createState() => _QuizzListChoiceState();
}

class _QuizzListChoiceState extends State<QuizzListChoice> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        PageName.quizz,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(57, 255, 145, 0),
            borderRadius: BorderRadius.circular(60),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            children: [
              Text(widget.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(widget.description,
                    style: const TextStyle(
                        fontSize: 14, fontStyle: FontStyle.italic)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizzGamePage extends StatelessWidget {
  const QuizzGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizzName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page détail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nom du Pokémon : $quizzName',
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Retour'),
            ),
          ],
        ),
      ),
    );
  }
}
