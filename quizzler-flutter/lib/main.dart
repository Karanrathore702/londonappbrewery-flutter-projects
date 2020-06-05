import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

void alertHandler() {
  Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.")
      .show();
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  Widget getScoreright() {
    scoreKeeper.add(Icon(
      Icons.check,
      color: Colors.green,
    ));
  }

  Widget getScorewrong() {
    scoreKeeper.add(Icon(
      Icons.clear,
      color: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quizBrain.getQuestionAnswer();

                if (correctAnswer == true) {
                  print("User banega Crorepati !");
                  getScoreright();
                } else {
                  print("User se nahi ho payega !");
                  getScorewrong();
                }

                setState(() {
                  quizBrain.nextQuestion();
                });
//                print("Set state was triggered");
//                setState(() {
//                  scoreKeeper.add(
//                  Icon(
//                    Icons.check,
//                    color: Colors.green,
//                  ));
//                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quizBrain.getQuestionAnswer();

                if (correctAnswer == false) {
                  print("User banega Crorepati !");
                  getScoreright();
                } else {
                  print("User se nahi ho payega !");
                  getScorewrong();
                }

                setState(() {
                  quizBrain.nextQuestion();
                });
                //The user picked false.
              },
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: scoreKeeper,
          ),
        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
