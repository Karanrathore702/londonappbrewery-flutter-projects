import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(XylophoneApp());

void playSound(int valuE_a) {
  final player = AudioCache();
  player.play("note$valuE_a.wav");
}

Expanded buildKey({Color colorval, int soundNumber}) {
  return Expanded(
    child: FlatButton(
      color: colorval,
      onPressed: () {
        playSound(soundNumber);
      },
    ),
  );
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(colorval: Colors.red, soundNumber: 1),
              buildKey(colorval: Colors.orange, soundNumber: 2),
              buildKey(colorval: Colors.yellow, soundNumber: 3),
              buildKey(colorval: Colors.green, soundNumber: 4),
              buildKey(colorval: Colors.teal, soundNumber: 5),
              buildKey(colorval: Colors.blue, soundNumber: 6),
              buildKey(colorval: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
