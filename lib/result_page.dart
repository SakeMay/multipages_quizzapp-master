import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'main.dart';

QuizBrain quizBrain = QuizBrain();

class ResultPage extends StatelessWidget {
  ResultPage({required this.score, required this.name});
  final int score;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 30,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Your Score',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '${score}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 130.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '${score >=
                        (0.6 * (quizBrain.getQuestionLength())).ceil()
                        ? 'Great Job!'
                        : 'Better Luck Next Time'} ${name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstScreen()));
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: const Text(
                      'HOME',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blueGrey,
                    height: 50.0,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
