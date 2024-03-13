import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.setAsset('assets/note$soundNumber.wav');
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildGlassKey(color: Colors.red, soundNumber: 1),
                buildGlassKey(color: Colors.orange, soundNumber: 2),
                buildGlassKey(color: Colors.yellow, soundNumber: 3),
                buildGlassKey(color: Colors.green, soundNumber: 4),
                buildGlassKey(color: Colors.blue, soundNumber: 5),
                buildGlassKey(color: Colors.indigo, soundNumber: 6),
                buildGlassKey(color: Colors.purple, soundNumber: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGlassKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextButton(
          onPressed: () {
            playSound(soundNumber);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: Text(""),
        ),
      ),
    );
  }
}
