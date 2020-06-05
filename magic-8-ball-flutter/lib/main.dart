import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.yellow,
          appBar: AppBar(
            title: Text('Dicee'),
            backgroundColor: Colors.teal,
          ),
          body: Ball(),
        ),
      ),
    );

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int image_of_ball = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset("images/ball$image_of_ball.png"),
              onPressed: () {
                setState(() {
                  int random = Random().nextInt(5) + 1;
                  image_of_ball = random;
                  print(random);
                });
//                print("I got clicked");
              },
            ),
          ),
        ],
      ),
    );
  }
}
