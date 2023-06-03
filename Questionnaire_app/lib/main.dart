import 'package:flutter/material.dart';
import 'Pages.dart';
import 'Quizz.dart';
import 'QuizzList.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<QuizzList> quizzList = [
    QuizzList(name: 'Questionnaire 1', description: 'Questionnaire Star Wars'),
    QuizzList(name: 'Questionnaire 2', description: 'Questionnaire Espace')
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
      // initialRoute: Pages.home,
      // routes: {
      //   Pages.quizz: (context) => const Quizz(),
      // },
      home: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Quizz App !'),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 255, 179, 0),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [DisplayQuizz(quizzList: quizzList)],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DisplayQuizz extends StatelessWidget {
  final List<QuizzList> quizzList;

  const DisplayQuizz({Key? key, required this.quizzList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz App'),
      ),
      body: ListView.builder(
        itemCount: quizzList.length,
        itemBuilder: (context, index) {
          final quizz = quizzList[index];
          return ListTile(
            title: Text(quizz.name),
            subtitle: Text(quizz.description),
          );
        },
      ),
    );
  }
}
