import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'result_page.dart';

class QuickMathPage extends StatefulWidget {
  @override
  _QuickMathPageState createState() => _QuickMathPageState();
}

class _QuickMathPageState extends State<QuickMathPage>
    with TickerProviderStateMixin {
  final Random _random = Random();
  int _score = 0;
  int _bestScore = 0;
  int _correctAnswer = 0;
  String _question = '';
  List<int> _options = [];
  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _hintAnimController;
  late Animation<double> _hintScaleAnimation;

  Timer? _hintTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goToResult();
      }
    });

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);

    _hintAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _hintScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).chain(CurveTween(curve: Curves.easeInOut)).animate(_hintAnimController);

    _hintAnimController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _hintAnimController.reverse();
      } else if (status == AnimationStatus.dismissed) {
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
    int a = _random.nextInt(10) + 1;
    int b = _random.nextInt(10) + 1;
    int type = _random.nextInt(4);
    int answer;
    String q;

    if (type == 0) {
      answer = a + b;
      int style = _random.nextInt(3);
      if (style == 0) {
        q = "? + $b = $answer";
        answer = a;
      } else if (style == 1) {
        q = "$a + ? = $answer";
        answer = b;
      } else {
        q = "$a + $b = ?";
        answer = a + b;
      }
    } else if (type == 1) {
      int result = (a > b) ? a - b : b - a;
      if (_random.nextBool()) {
        q = "? - $b = $result";
        answer = b + result;
      } else if (_random.nextBool()) {
        q = "$a - ? = $result";
        answer = a - result;
      } else {
        q = "$a - $b = ?";
        answer = a - b;
      }
    } else if (type == 2) {
      answer = a * b;
      q = "$a × $b = ?";
    } else {
      answer = a;
      int product = a * b;
      q = "$product ÷ $b = ?";
    }

    Set<int> optionSet = {answer};
    while (optionSet.length < 4) {
      optionSet.add(answer + _random.nextInt(10) - 5);
    }

    _options = optionSet.toList()..shuffle();

    setState(() {
      _question = q;
      _correctAnswer = answer;
    });

    _controller.reset();
    _controller.forward();

    _hintTimer?.cancel();
    _hintAnimController.stop();
    _hintAnimController.reset();

    _hintTimer = Timer(Duration(seconds: 5), () {
      _hintAnimController.forward();
    });
  }

  void _handleAnswer(int selected) {
    if (selected == _correctAnswer) {
      setState(() {
        _score++;
      });
      _generateQuestion();
    } else {
      _goToResult(
        wasWrong: true,
        question: _question,
        yourAnswer: selected.toString(),
        correctAnswer: _correctAnswer.toString(),
        explanation:
            'Because $_question is solved as $_correctAnswer = $_question logic here.',
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
    int bestScore = prefs.getInt('best_score') ?? 0;
    if (_score > bestScore) {
      await prefs.setInt('best_score', _score);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:
            (_) => ResultPage(
              score: _score,
              bestScore: max(_score, bestScore),
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
    _hintTimer?.cancel();
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
                    children: [
                      Expanded(
                        child: Text(
                          'Quick Maths',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.emoji_events,
                            color: Colors.amber,
                            size: 24,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '$_bestScore',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
                            Color barColor =
                                _animation.value > 0.3
                                    ? Colors.white
                                    : Colors.red;
                            return Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: _animation.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: barColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    _question,
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                  SizedBox(height: 30),
                  ..._options.map(
                    (opt) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _handleAnswer(opt),
                          child: Text('$opt', style: TextStyle(fontSize: 20)),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF7A5DF5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.lightbulb, color: Color(0xFF7A5DF5)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
