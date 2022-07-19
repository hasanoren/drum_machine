import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Drum Machine")),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Pile("sound1", Colors.purple),
                ),
                Expanded(child: Pile("sound2", Colors.white)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Pile("sound3", Colors.pink)),
                Expanded(child: Pile("sound4", Colors.amberAccent)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Pile("sound1", Colors.brown)),
                Expanded(child: Pile("sound2", Colors.indigoAccent)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Pile("sound3", Colors.grey)),
                Expanded(child: Pile("sound4", Colors.tealAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  FlatButton Pile(String sound, Color color) {
    return FlatButton(
      padding: const EdgeInsets.all(8),
      onPressed: () {
        setState(() {
          final player = AudioPlayer();
          player.play(AssetSource("sounds/$sound.wav"));
        });
      },
      child: Container(
        color: color,
      ),
    );
  }
}
