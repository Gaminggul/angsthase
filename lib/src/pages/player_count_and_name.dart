// ignore_for_file: library_private_types_in_public_api

import 'package:angsthase/src/pages/game.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Players extends StatefulWidget {
  const Players({super.key});

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  void _setPlayerCount(int count) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NamesScreen(playerCount: count),
      ),
    );
  }

  Widget _buildPlayerButtonsRow(int start, int end) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        end - start + 1,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextButton(
            onPressed: () => _setPlayerCount(index + start),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return const Color.fromARGB(255, 41, 83, 223);
                },
              ),
            ),
            child: Text(
              '${index + start}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Willkommen zu Angsthase!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 223, 222, 247)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Add some spacing
            const Text(
              'Gib die Spieleranzahl ein',
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 223, 222, 247)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Add some spacing
            Column(
              children: [
                _buildPlayerButtonsRow(2, 4), // 2, 3, 4 players
                _buildPlayerButtonsRow(5, 7), // 5, 6, 7 players
                _buildPlayerButtonsRow(8, 10), // 8, 9, 10 players
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NamesScreen extends StatefulWidget {
  final int playerCount;

  const NamesScreen({super.key, required this.playerCount});

  @override
  _NamesScreenState createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  late List<String> playerNames;
  late List<TextEditingController>
      _controllers; // List of text editing controllers

  @override
  void initState() {
    super.initState();
    // Initialize playerNames and _controllers
    playerNames = List<String>.filled(widget.playerCount, "", growable: false);
    _controllers = List.generate(
      widget.playerCount,
      (index) => TextEditingController(text: playerNames[index]),
    );
    _loadPlayerNames();
  }

  void _loadPlayerNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < playerNames.length; i++) {
      String playerName = prefs.getString('player$i') ?? '';
      playerNames[i] = playerName;
      _controllers[i].text = playerName; // Update controller with loaded name
    }
    setState(() {});
  }

  void _savePlayerNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < playerNames.length; i++) {
      await prefs.setString('player$i', _controllers[i].text);
    }
  }

  void _startGame() async {
    _savePlayerNames();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(
            playerNames:
                _controllers.map((controller) => controller.text).toList()),
      ),
    );
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: widget.playerCount,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        controller: _controllers[index],
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Player ${index + 1}',
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {});
                          _savePlayerNames();
                        },
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_controllers.any(
                          (controller) => controller.text.trim().isEmpty)) {
                        // Optionally, alert the user that all names must be filled.
                        return;
                      }
                      _startGame();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          return _controllers.any((controller) =>
                                  controller.text.trim().isEmpty)
                              ? const Color.fromARGB(255, 128, 128, 128)
                              : const Color.fromARGB(255, 255, 255, 255);
                        },
                      ),
                    ),
                    child: const Text('Weiter'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Zurück'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
