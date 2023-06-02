import 'package:flutter/material.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // <== définit le thème
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          // <== définit le thème
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        home: ScaffoldMessenger(
            child: Scaffold(
                appBar: AppBar(
          title: const Text('Page d\'accueil'),
        ))));
  }
}
