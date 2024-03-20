// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  final List<String> playerNames;

  const GameScreen({super.key, required this.playerNames});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> questions = [
    'Nenne den Namen der Person, mit der du den besten Sex hattest # 3 Shots',
    'Wähle einen Spieler, der dir einen Shot in den Mund spuckt # 3 Shots',
    'Nenne den Spieler mit der besten Oberweite # 2 Shots',
    'Lutsche den Finger eines Spielers so, als würdest du ihn verführen wollen # 2 Shots',
    'Gib jedem Spieler des anderen Geschlechts einen Kuss auf den Mund # 3 Shots',
    'Rufe einen Sexshop an und frage nach detaillierter Beratung für ein Produkt # 4 Shots',
    'Keine Vape/IQOS bis zum Ende des Spiels # 5 Shots',
    'Schreibe deiner Ex „Ich vermisse dich“ # 3 Shots',
    'Erzähle wann du dein erstes Mal hattest und wie es war # 1 Shot',
    'Erkläre warum deine letzte Beziehung kaputtgegangen ist # 3 Shots',
    'Lege dich für 3 Minuten auf den Schoß von dem Spieler rechts von dir # 2 Shots',
    'Ruf eine Pizzeria an und bestelle Sushi # 4 Shots',
    'Wähle den Spieler, mit dem du am ehesten was haben würdest # 3 Shots',
    'Sag der Gruppe deinen Bodycount # 1 Shot',
    'Trinke, wenn du jemals etwas mit einer/einem Ex von dir hattest',
    'Zählt bis 3 und zeigt alle auf die Person, die am wenigsten Männer/Frauen abbekommt. Die Person muss das ganze Glas austrinken',
    'Lass alle Spieler für 30s dein Handy durchgehen # 3 Shots',
    'Lass den Spieler zu deiner Linken dir auf den Hintern schlagen # 1 Shot',
    'Gebe dem Spieler rechts von dir einen leidenschaftlichen Kuss # 4 Shots',
    'Schreibe jemandem deiner Wahl, ob er mit dir einen dreier haben will # 3 Shots',
    'Wähle einen Spieler der 5 Minuten auf deinem Schoß sitzt # 3 Shots',
    'Beschreibe den schlechtesten Kuss, den du jemals hattest, ohne Namen zu nennen # 2 Shots',
    'Welche Spieler sollten zusammenkommen',
    'Lass den Spieler zu deiner linken dir einen Knutschfleck an der Stelle seiner Wahl machen # 2 Shots',
    'Halte Händchen mit der Person links von dir, bis du, dass nächste Mal an der Reihe bist # 2 Shots',
    'Tausch ein Kleidungsstück mit einem anderen Spieler # 3 Shots',
    'Lese die letzte Nachricht die du geschickt hast vor und erkläre den Kontext',
    'Beschreibe die Unterwäsche von einem Spieler des anderen Geschlechts # 3 Shots',
    'Absturzkarte: jeder muss sein ganzes Glas austrinken. Keine Ausnahme!',
    'Nenne zwei Spieler, mit denen du einen Dreier haben würdest # 1 Shot',
    'Nenne den Spieler, der am ehesten fremdgehen würde # 2 Shots',
    'Wähle einen Spieler, der dir ins Ohr beißen darf # 4 Shots',
    'Lass jeden Spieler dir einen Kuss geben, oder eine leichte Ohrfeige # 4 Shots',
    'Küsse den Spieler zu deiner linken # 3 Shots',
    'Imitiere wie du dich bei einem Orgasmus anhörst und wie du dabei aussiehst # 4 Shots',
    'Gebe dem Spieler zu deiner linken einen Knutschfleck # 3 Shots',
    'Nenne den Spieler mit dem attraktivsten Hintern # 2 Shots',
    'Nenne den Spieler in der Gruppe, der am ehesten einen Porno drehen würde # 1 Shot',
    'Nimm einen Shot, ohne deine Hände zu benutzen # 2 Shots',
    'Alle die sich schonmal geküsst haben, müssen sich noch einmal küssen',
    'Deck auf, mit welchem Spieler du die meisten Fantasien hast # 1 Shot',
    'F*ck, marry, kill mit allen Spielern in der Gruppe # 1 Shot',
    'DM an die erste Person in deinem Insta Feed # 2 Shots',
    'Küsse die Person gegenüber von dir # 3 Shots',
    'Zeig der Person zu deiner rechten 2 sexy Bilder von dir # 3 Shots',
    'Welcher Spieler gibt die besten Umarmungen',
    'Poste ein couple Bild mit einem Spieler des anderen Geschlechts in deine öffentliche Instastory # 3 Shots',
    'Snappe deinem crush # 2 Shots',
    'Nenne die attraktivste Person aus deiner Abteilung # 1 Shot',
    'Wähle einen Spieler aus, welcher dir einen Lapdance geben muss # 3 Shots',
    'Lasse die Gruppen deinen privaten Bereich bei Snapchat sehen # 2 Shots',
    'Ziehe 2 Kleidungsstücke aus # 2 Shots',
    'Welcher Spieler ist die größte hoe # 2 Shots',
    'Lass die Gruppe jemandem über deinen Insta Account schreiben # 2 Shots',
    'Gebe jedem Spieler einen Kuss # 3 Shots',
    'Gehe mit dem Spieler zu deiner Linken für 3 Minuten in einen anderen Raum # 2 Shots',
    'Rate welche Spieler gerade einen String tragen # 3 Shots',
    'Dein Gegenüber entscheidet, welches Kleidungsstück du ausziehen musst # 3 Shots',
    'Was ist dein größtes Turn-on # 2 Shots',
    'Jeder Spieler darf dir eine Frage stellen und du musst diese wahrheitsgemäß beantworten # 3 Shots',
    'Der Spieler zu deiner linken darf dir einen Knutschfleck in Form seines Anfangsbuchstabens machen # 3 Shots',
    'Drücke den Spieler zu deiner Rechten an die Wand und küsse ihn # 4 Shots',
    'Lass die Gruppe deine Insta DMs durchschauen # 3 Shots',
    'Alle die schon einen Mitspieler geküsst haben, trinken',
    'Nenne den Spieler links von dir Mommy/Daddy für den Rest des Spiels # 2 Shots',
    'Trinke, wenn du schon einmal jemanden, der 5, oder mehr, Jahre älter als du warst, geküsst hast',
    'Nenne 3 deiner größten Abturns # 1 Shot',
    'Stelle deine Lieblingssexstellung mit einem Spieler des anderen Geschlechts nach # 3 Shots',
    'Beschreibe deine Unterwäsche # 1 Shot',
    'Küsse den attraktivsten Mitspieler des anderen Geschlechts # 3 Shots',
    'Beschreibe deinen Type # 1 Shot',
    'Tausche ein Kleidungsstück mit einem Spieler des anderen Geschlechts # 2 Shots',
    'Nenne deinen Celebrity Crush # 1 Shot',
    'Trinke 5 Shots, wenn du schon einmal Nudes versendet hast',
    '5 minutes in heaven mit einem Spieler des anderen Geschlechts # 2 Shots',
    'Gib dem Spieler zu deiner Rechten einen Lapdance # 2 Shots',
    'Wann war deine letzte Situationship/Talking stage -> erzähle davon # 2 Shots',
    'Alle die verliebt sind trinken 1 Shot',
  ];

  String currentQuestion = '';
  String currentDrinkAmount = '';
  String currentPlayer = '';

  @override
  void initState() {
    super.initState();
    _pickRandomQuestion();
    currentPlayer =
        widget.playerNames[Random().nextInt(widget.playerNames.length)];
  }

  void _pickRandomQuestion() {
    if (questions.isEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const EndScreen()),
      );
      return;
    }

    // Select a random index within the range of available questions
    int randomIndex = Random().nextInt(questions.length);

    // Get the question at the random index
    String question = questions[randomIndex];

    // Split the question based on the "#" symbol
    List<String> parts = question.split('#');

    // Extract the question and the drink amount
    String questionText = parts[0].trim();
    String drinkAmount = parts.length > 1 ? parts[1].trim() : '';

    questions.removeAt(randomIndex);

    setState(() {
      currentQuestion = questionText;
      currentDrinkAmount = drinkAmount;
      int currentPlayerIndex = widget.playerNames.indexOf(currentPlayer);
      currentPlayer = widget
          .playerNames[(currentPlayerIndex + 1) % widget.playerNames.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back arrow
        title: const Text(
          'Angsthase',
          style: TextStyle(color: Color(0xFFd3d3d3)),
        ),
        backgroundColor: const Color(0xFF212955),
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFF212955),
              Color(0xFF3b3a80),
              Color(0xFF7f4698),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentPlayer,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 223, 222, 247)),
              ),
              const SizedBox(height: 20),
              const Text(
                'Du bist dran!',
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 223, 222, 247)),
              ),
              const SizedBox(height: 15),
              const Text(
                'Frage:',
                style: TextStyle(
                    fontSize: 22, color: Color.fromARGB(255, 223, 222, 247)),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  currentQuestion,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 223, 222, 247)),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'oder',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 223, 222, 247)),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                currentDrinkAmount,
                style: const TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 223, 222, 247)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _pickRandomQuestion();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 41, 83, 223),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  textStyle: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 223, 222, 247)),
                ),
                child: const Text(
                  'Nächste Frage',
                  style: TextStyle(color: Color.fromARGB(255, 223, 222, 247)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Zurück'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//EndScreen

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back arrow
        title: const Text(
          'Angsthase',
          style: TextStyle(color: Color(0xFFd3d3d3)),
        ),
        backgroundColor: const Color(0xFF212955),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFF212955),
              Color(0xFF3b3a80),
              Color(0xFF7f4698),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Du hast es geschafft!',
                style: TextStyle(
                    fontSize: 24, color: Color.fromARGB(255, 223, 222, 247)),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Noch einmal?',
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 223, 222, 247)),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 41, 83, 223),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                textStyle: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 223, 222, 247)),
              ),
              child: const Text(
                'Zurück',
                style: TextStyle(color: Color.fromARGB(255, 223, 222, 247)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
