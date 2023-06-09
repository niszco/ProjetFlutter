class QuizzData {
  static List<Quizz> getQuizzList() {
    return [
      Quizz(
        name: "Culture Geek : Star Wars",
        questions: [
          TextQuestion(
              "Quel est le nom du vaisseau spatial piloté par Han Solo ?",
              "Faucon Millenium"),
          TextQuestion(
              "Quelle est la planète d'origine de Chewbacca ?", "Kashyyk"),
          TextQuestion(
              "Quel est le nom complet de Dark Vador ?", "Anakin Skywalker"),
        ],
      ),
      Quizz(
        name: "Culture G : Espace",
        questions: [
          MultipleChoiceQuestion(
              "Quelle est la planète la plus proche du Soleil ?",
              ["Vénus", "Mercure", "Terre", "Mars"],
              "Mercure"),
          MultipleChoiceQuestion(
              "Quelle est la plus grande planète du système solaire ?",
              ["Jupiter", "Saturne", "Uranus", "Neptune"],
              "Jupiter"),
          MultipleChoiceQuestion(
              "Quel est l'élément le plus commun dans l'Univers ?",
              ["Hélium", "Fer", "Oxygène", "Hydrogène"],
              "Hydrogène"),
          MultipleChoiceQuestion(
              "Quelle est la plus grande étoile connue dans l'univers ?",
              ["VY Canis Majoris", "Le Soleil", "Sirius", "Betelgeuse"],
              "VY Canis Majoris"),
          MultipleChoiceQuestion(
              "Quelle est la première personne à avoir marché sur la Lune ?",
              ["Neil Armstrong", "Buzz Aldrin", "Yuri Gagarin", "Alan Shepard"],
              "Neil Armstrong"),
        ],
      ),
      Quizz(
        name: "Trouve le Pays !",
        questions: [
          ImageQuestion("assets/france.png",
              ["France", "Espagne", "Italie", "Allemagne"], "France"),
          ImageQuestion("assets/usa.png",
              ["États-Unis", "Canada", "Mexique", "Royaume-Uni"], "États-Unis"),
          ImageQuestion("assets/japan.png",
              ["Japon", "Chine", "Corée du Sud", "Thaïlande"], "Japon"),
        ],
      ),
    ];
  }
}

class Quizz {
  final String name;
  final List<Question> questions;

  Quizz({required this.name, required this.questions});
}

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

  bool checkAnswer(String userAnswer) {
    if (userAnswer == correctAnswer) {
      return true;
    } else {
      return false;
    }
  }
}

class ImageQuestion extends Question {
  final String imagePath;
  final List<String> choices;
  final String correctAnswer;

  ImageQuestion(this.imagePath, this.choices, this.correctAnswer);

  bool checkAnswer(String userAnswer) {
    if (userAnswer == correctAnswer) {
      return true;
    } else {
      return false;
    }
  }
}
