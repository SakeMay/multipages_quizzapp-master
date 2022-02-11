import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(q: '1 + 1 = 2', a: true),
    Question(q: 'น้ำเงิน+เขียว = ส้ม', a: false),
    Question(q: 'ทองเป็นอโลหะ', a: false),
    Question(q: 'แดง+น้ำเงิน = ม่วง', a: true),
    Question(q: 'TOI13 จัดที่ MWIT', a: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String? getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool? getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  int getQuestionLength() {
    return _questionBank.length;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
