import 'dart:io';

class Quiz {
  List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;

  Quiz(this.questions);

  void startQuiz() {
    print("Teste hos geldin!");
    for (var i = 0; i < questions.length; i++) {
      var question = questions[i];
      print("Soru ${i + 1}: ${question.text}");
      for (var j = 0; j < question.options.length; j++) {
        print("${j + 1}. ${question.options[j]}");
      }
      stdout.write("Cevabin: ");
      var userAnswer = int.tryParse((stdin.readLineSync())!);
      if (userAnswer != null &&
          userAnswer >= 1 &&
          userAnswer <= question.options.length) {
        if (question.isCorrect(userAnswer - 1)) {
          print("Dogru!\n");
          score++;
        } else {
          print("Yanlis!\n");
        }
      } else {
        print("Gecersiz cevap, sonraki soru geliyor.\n");
      }
    }
    print("Test Tamamlandi");
  }
}

class Question {
  String text;
  List<String> options;
  int correctOptionIndex;

  Question(this.text, this.options, this.correctOptionIndex);

  bool isCorrect(int userAnswerIndex) {
    return userAnswerIndex == correctOptionIndex;
  }
}

class User {
  String name;

  User(this.name);

  void viewScore(int score, int totalQuestions) {
    print("$name Puanin: $score/$totalQuestions");
  }
}

void main() {
  var questions = <Question>[
    Question("Turkiyenin baskenti neresidir?",
        ["Londra", "Berlin", "Ankara", "Paris"], 2),
    Question(
        "Atakum nereni ilcesidir?", ["Ankara", "Samsun", "Sivas", "Tokat"], 1),
    Question("2 + 2 kac yapar?", ["3", "4", "5", "6"], 1),
    Question("Samsun ili hangi bolgededir?",
        ["Karadeniz", "Ic Anadolu", "Ege", "Marmar"], 0),
    Question("Au hangi Elementin sempoludur?",
        ["Gumus", "Altin", "Karbon", "Lityum"], 1),
    Question("Karbon atomunun sembolu nedir?", ["K", "P", "Fe", "C"], 3),
    Question("Atmosferdebulunan en yogun gaz nedir?",
        ["Oksijen", "Karbon Dioksit", "Azot", "Hidrojen"], 2),
    Question("Hangisi Afrika kitasindan bir ulkedirr?",
        ["Misir", "Italya", "Cekya", "Turkiye"], 0),
    Question("Ondokuz Mayis Universitesi hangi ilimizdedir?",
        ["Sivas", "Samsun", "Erzurum", "Sinop"], 1),
    Question("Hangis Ege bolgemizden bir ildir?",
        ["Izmir", "Ankara", "Tokat", "Kayseri"], 0),
    Question("Dunya kac bolgeye ayrilmistir?", ["4", "5", "6", "7"], 3),
    Question(
        "Bu odev hangi derse aitir?",
        [
          "Mobil Programlama",
          "Programlamaya giris 1",
          "Java 1",
          "Sistem Programlama"
        ],
        0),
    Question("Bugday en cok hangi bolgemizde yetisir?",
        ["Guney Dogu Anadolu", "Dogu Anadolu", "Ic Anadolu", "Karadeniz"], 2),
    Question(
        "Hangisi bir deyim degildir?",
        [
          "Esekten dusmus karpuza donmek",
          "Dut yemis bulbule donmek",
          "Isik gormus tavsana donmek",
          "Igne yutmus maymuna donmek"
        ],
        2),
    Question(
        "Sporda elini becerikli bir biçimde kullanabilen kimse hangisinin sözlük tanımıdır?",
        [" Pamuk elli", "Ipek elli", "Makas elli", "Kadife elli"],
        3),
    Question("Kumru, hangi ilin bir ilçesidir?",
        ["Izmir", "Istanbul", "Ankara", "Ordu"], 3),
    Question(
        "Osmanlilarda sarayin korunmasina ve sehrin guvenligine bakmakla gorevli olan erlerden her biri hangisinin sozluk tanimidir?",
        ["Cesnici", "Bostanci", "Carkci", "Bezirgan"],
        2),
    Question("Cihanşümul ne demektir?",
        ["Evrensel", "Uluslararasi", "Dunya disi", "Gosterisli"], 0),
    Question(
        "TDK'nin kisaltmalar kurallarina gore, 'bir gramin' kisaltmasinin dogru yazilisi hangisidir??",
        ["1 g", "1 gr", "1 gm", "1 grm"],
        1),
    Question("Hangi ulkenin adi 'iki deniz' anlamina gelir?",
        ["Panama", "Bahreyn", "Umman", "Tayland"], 1),
  ];

  var quiz = Quiz(questions);

  print("Isminiz giriniz:");
  var userName = stdin.readLineSync();
  var user = User(userName!);

  quiz.startQuiz();
  user.viewScore(quiz.score, quiz.questions.length);
}
