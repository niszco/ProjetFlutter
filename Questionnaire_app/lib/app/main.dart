import 'package:flutter/material.dart';
import '../pages/Pages.dart';
import '../quizz/Quizz.dart';
import 'QuizzList.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final quizzList = <QuizzList>{
    QuizzList(name: 'Questionnaire 1', description: 'Questionnaire Star Wars'),
    QuizzList(name: 'Questionnaire 2', description: 'Questionnaire Espace')
  };

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
            titleSpacing: 0.5,
            backgroundColor: const Color.fromARGB(255, 255, 179, 0),
          ),
        ),
      ),
    );
  }
}
