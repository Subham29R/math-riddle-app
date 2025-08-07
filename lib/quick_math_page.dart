import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'result_page.dart';
import 'milestone_popup.dart';
import 'final_completion_page.dart';

class QuickMathPage extends StatefulWidget {
  @override
  _QuickMathPageState createState() => _QuickMathPageState();
}

class _QuickMathPageState extends State<QuickMathPage> with TickerProviderStateMixin {
  final Random _random = Random();
  int _score = 0;
  int _bestScore = 0;
  int _correctAnswer = 0;
  String? _explanation;
  String _question = '';
  List<int> _options = [];
  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _hintAnimController;
  late Animation<double> _hintScaleAnimation;

  int _lastTimerDuration = 10;
  bool hintStarted = false;
  bool _isBooleanQuestion = false;
  bool _showingMilestone = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _goToResult(
            wasWrong: true,
            question: _question,
            yourAnswer: _isBooleanQuestion ? "No Answer" : "No Answer",
            correctAnswer: _isBooleanQuestion
                ? (_correctAnswer == 1 ? "True" : "False")
                : _correctAnswer.toString(),
            explanation: _explanation,
          );
        }
      });

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
    _animation.addListener(() {
      if (!hintStarted) {
        final timeLeft = _controller.duration!.inSeconds * _animation.value;
        if (timeLeft <= 5) {
          hintStarted = true;
          _hintAnimController.forward();
        }
      }
    });

    _hintAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _hintScaleAnimation = Tween<double>(begin: 1.0, end: 1.2)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_hintAnimController);

    _hintAnimController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _hintAnimController.reverse();
      } else if (status == AnimationStatus.dismissed && _controller.isAnimating) {
        _hintAnimController.forward();
      }
    });

    _loadBestScore();
    _generateQuestion();
  }

  void _loadBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _bestScore = prefs.getInt('best_score') ?? 0;
    });
  }

  void _generateQuestion() {
    int timerSeconds;
    if (_score < 10)
      timerSeconds = 10;
    else if (_score < 20)
      timerSeconds = 9;
    else if (_score < 30)
      timerSeconds = 8;
    else if (_score < 40)
      timerSeconds = 7;
    else if (_score < 50)
      timerSeconds = 6;
    else
      timerSeconds = 5;

    _controller.duration = Duration(seconds: timerSeconds);
    _controller.reset();
    _controller.forward();

    hintStarted = false;
    _hintAnimController.reset();
    _hintAnimController.stop();

    int a, b;
    if (_score < 70) {
      a = _random.nextInt(10) + 1;
      b = _random.nextInt(10) + 1;
    } else {
      a = _random.nextInt(90) + 10;
      b = _random.nextInt(90) + 10;
    }

    int answer;
    String q;
    String explanation;
    int type;

    if (_score < 10)
      type = 0;
    else if (_score < 20)
      type = 1;
    else
      type = _random.nextInt(5);

    if (type == 0) {
      _isBooleanQuestion = false;
      int style = _random.nextInt(3);
      answer = a + b;
      if (style == 0) {
        q = "? + $b = $answer";
        explanation = "$answer - $b = $a";
        answer = a;
      } else if (style == 1) {
        q = "$a + ? = $answer";
        explanation = "$answer - $a = $b";
        answer = b;
      } else {
        q = "$a + $b = ?";
        explanation = "$a + $b = ${a + b}";
      }
    } else if (type == 1) {
      _isBooleanQuestion = false;
      int result = (a > b) ? a - b : b - a;
      if (_random.nextBool()) {
        q = "? - $b = $result";
        answer = b + result;
        explanation = "$answer - $b = $result";
      } else if (_random.nextBool()) {
        q = "$a - ? = $result";
        answer = a - result;
        explanation = "$a - $answer = $result";
      } else {
        q = "$a - $b = ?";
        answer = a - b;
        explanation = "$a - $b = ${a - b}";
      }
    } else if (type == 2) {
      _isBooleanQuestion = false;
      answer = a * b;
      q = "$a × $b = ?";
      explanation = "$a × $b = $answer";
    } else if (type == 3) {
      _isBooleanQuestion = false;
      answer = a;
      int product = a * b;
      q = "$product ÷ $b = ?";
      explanation = "$product ÷ $b = $answer";
    } else {
      _isBooleanQuestion = true;
      int leftA = _random.nextInt(10) + 1;
      int leftB = _random.nextInt(10) + 1;
      int rightA = _random.nextInt(10) + 1;
      int rightB = _random.nextInt(10) + 1;

      int leftVal = leftA + leftB;
      int rightVal = rightA + rightB;

      bool useGreater = _random.nextBool();
      bool isCorrect = useGreater ? (leftVal > rightVal) : (leftVal < rightVal);

      q = "$leftA + $leftB ${useGreater ? ">" : "<"} $rightA + $rightB";
      answer = isCorrect ? 1 : 0;
      explanation =
          "$leftVal ${useGreater ? ">" : "<"} $rightVal is ${isCorrect ? "True" : "False"}";
      _options = [1, 0];
    }

    if (type != 4) {
      Set<int> optionSet = {answer};
      while (optionSet.length < 4) {
        optionSet.add(answer + _random.nextInt(10) - 5);
      }
      _options = optionSet.toList()..shuffle();
    }

    setState(() {
      _question = q;
      _correctAnswer = answer;
      _explanation = explanation;
    });
  }

  void _handleAnswer(int selected) async {
<<<<<<< HEAD
    if (_showingMilestone) return;

    if (selected == _correctAnswer) {
      _controller.stop();

      int nextScore = _score + 1;

      int newTimerDuration;
      if (nextScore <= 10)
        newTimerDuration = 10;
      else if (nextScore <= 20)
        newTimerDuration = 9;
      else if (nextScore <= 30)
        newTimerDuration = 8;
      else if (nextScore <= 40)
        newTimerDuration = 7;
      else if (nextScore <= 50)
        newTimerDuration = 6;
      else
        newTimerDuration = 5;

      bool isMilestone = [11, 21, 31, 41, 51].contains(nextScore);
      setState(() {
        _score = nextScore;
      });

      if (_score == 100) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => FinalCompletionPage()),
        );
        return;
      }

      if (isMilestone) {
        _showingMilestone = true;
        await Future.delayed(Duration(milliseconds: 200)); // Ensure UI updates
        await Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            barrierDismissible: false,
            pageBuilder:
                (_, __, ___) => MilestonePopup(
                  newTimerValue: newTimerDuration,
                  level: _score,
                ),
          ),
        );
        _showingMilestone = false;
      }

      _generateQuestion();
    } else {
      _goToResult(
        wasWrong: true,
        question: _question,
        yourAnswer:
            _isBooleanQuestion
                ? (selected == 1 ? "True" : "False")
                : selected.toString(),
        correctAnswer:
            _isBooleanQuestion
                ? (_correctAnswer == 1 ? "True" : "False")
                : _correctAnswer.toString(),
        explanation: _explanation,
=======
  if (_showingMilestone) return;

  if (selected == _correctAnswer) {
    int newScore = _score + 1;

    int newTimerDuration;
    if (newScore <= 10)
      newTimerDuration = 10;
    else if (newScore <= 20)
      newTimerDuration = 9;
    else if (newScore <= 30)
      newTimerDuration = 8;
    else if (newScore <= 40)
      newTimerDuration = 7;
    else if (newScore <= 50)
      newTimerDuration = 6;
    else
      newTimerDuration = 5;

    bool isMilestone = [10, 20, 30, 40, 50].contains(newScore);

    _controller.stop();

    setState(() {
      _score = newScore;
    });

    if (isMilestone) {
      _showingMilestone = true;

      await Navigator.push(
        context,
        PageRouteBuilder(
          opaque: false,
          barrierDismissible: false,
          pageBuilder: (_, __, ___) => MilestonePopup(
            newTimerValue: newTimerDuration,
            level: newScore,
          ),
        ),
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1
      );

      _showingMilestone = false;
    }
    _generateQuestion();
  } else {
    _goToResult(
      wasWrong: true,
      question: _question,
      yourAnswer: _isBooleanQuestion
          ? (selected == 1 ? "True" : "False")
          : selected.toString(),
      correctAnswer: _isBooleanQuestion
          ? (_correctAnswer == 1 ? "True" : "False")
          : _correctAnswer.toString(),
      explanation: _explanation,
    );
  }
}


  void _goToResult({
    bool wasWrong = false,
    String? question,
    String? yourAnswer,
    String? correctAnswer,
    String? explanation,
  }) async {
    _controller.stop();
    final prefs = await SharedPreferences.getInstance();
    int previousBest = prefs.getInt('best_score') ?? 0;

    if (_score > previousBest) {
      await prefs.setInt('best_score', _score);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          score: _score,
          bestScore: previousBest,
          wasWrong: wasWrong,
          question: question,
          yourAnswer: yourAnswer,
          correctAnswer: correctAnswer,
          explanation: explanation,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _hintAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A5DF5),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.psychology, color: Colors.white, size: 28),
                          SizedBox(width: 6),
                          Text(
                            '$_score',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Quick Maths',
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.emoji_events, color: Colors.amber, size: 28),
                          SizedBox(width: 6),
                          Text(
                            '$_bestScore',
                            style: TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.white, size: 24),
                      SizedBox(width: 10),
                      Expanded(
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            Color barColor = _animation.value > 0.3 ? Colors.white : Colors.red;
                            return Container(
                              height: 20,
                              decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8)),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: _animation.value,
                                child: Container(
                                  decoration: BoxDecoration(color: barColor, borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(_question, style: TextStyle(color: Colors.white, fontSize: 26)),
                  SizedBox(height: 30),
                  ..._options.map((opt) {
                    String label = (_score >= 20 && _options.length == 2)
                        ? (opt == 1 ? "True" : "False")
                        : opt.toString();
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _handleAnswer(opt),
                          child: Text(label, style: TextStyle(fontSize: 20)),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF7A5DF5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
<<<<<<< HEAD
=======
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: ScaleTransition(
                  scale: _hintScaleAnimation,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.lightbulb, color: Color(0xFF7A5DF5)),
                    ),
                  ),
                ),
              ),
            ),
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1
          ],
        ),
      ),
    );
  }
}
