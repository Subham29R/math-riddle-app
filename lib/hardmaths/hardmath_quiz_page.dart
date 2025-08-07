import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hardmath_data.dart';
import 'hardmath_success_page.dart';
import 'hardmath_champion_screen.dart';
import 'package:mathverse/dialog/hint_options_dialog.dart';
import 'hardmath_hint_data.dart';

class HardMathQuizPage extends StatefulWidget {
  final int startIndex;

  const HardMathQuizPage({super.key, required this.startIndex});

  @override
  State<HardMathQuizPage> createState() => _HardMathQuizPageState();
}

class _HardMathQuizPageState extends State<HardMathQuizPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isAnswerCorrect = false;
  bool _submitted = false;
  bool hasWatchedHint = false;

  @override
  void initState() {
    super.initState();
    _saveLastPlayedProgress();
    _controller.addListener(() {
      setState(() {});
    });
  }

  Future<void> _saveLastPlayedProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastPlayedSection', 'hardMath');
    await prefs.setInt('lastPlayedIndex', widget.startIndex);
  }

  Future<void> _checkAnswer() async {
    final userAnswer = _controller.text.trim().toLowerCase();
    final correctAnswer =
        hardMathQuestions[widget.startIndex].answer.trim().toLowerCase();

    setState(() {
      _isAnswerCorrect = userAnswer == correctAnswer;
      _submitted = true;
    });

    if (_isAnswerCorrect) {
      final prefs = await SharedPreferences.getInstance();
      final completed = prefs.getInt('hardMath_completed') ?? 0;
      if (widget.startIndex + 1 > completed) {
        await prefs.setInt('hardMath_completed', widget.startIndex + 1);
      }

      if (!mounted) return;

      if (widget.startIndex + 1 == 30) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HardMathSuccessPage(nextIndex: 30),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MathChampionScreen()),
        );
      } else {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                HardMathSuccessPage(nextIndex: widget.startIndex + 1),
          ),
        );
      }
    }
  }

  void _handleKey(String value) {
    if (value == 'C') {
      _controller.clear();
    } else if (value == '<') {
      final text = _controller.text;
      if (text.isNotEmpty) {
        _controller.text = text.substring(0, text.length - 1);
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
      }
    } else {
      _controller.text += value;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = hardMathQuestions[widget.startIndex];
    final isScrollable = widget.startIndex >= 20;

    final content = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: 8),
            widget.startIndex >= 20 && question.imagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      question.imagePath!,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: 200,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      question.question,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
            const SizedBox(height: 16),
            Text(
              _controller.text,
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF7A5DF5),
              ),
            ),
            const SizedBox(height: 10),
            Container(height: 5, width: 120, color: const Color(0xFF7A5DF5)),
          ],
        ),
        const SizedBox(height: 10),
        const Spacer(),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => HintOptionsDialog(
                    hasWatchedHint: hasWatchedHint,
                    onHintAd: () {
                      setState(() {
                        hasWatchedHint = true;
                      });
                    },
                    onSolutionAd: () {},
                    hintText: hardMathHintList[widget.startIndex].hint,
                    solutionText: hardMathHintList[widget.startIndex].solution,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lightbulb, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text('Hint', style: GoogleFonts.poppins()),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [_buildKey('1'), _buildKey('2'), _buildKey('3')],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [_buildKey('4'), _buildKey('5'), _buildKey('6')],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [_buildKey('7'), _buildKey('8'), _buildKey('9')],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [_buildKey('<'), _buildKey('0'), _buildKey('C')],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _controller.text.trim().isEmpty
                          ? null
                          : _checkAnswer,
                      icon: const Icon(Icons.check),
                      label: Text(
                        'Enter',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7A5DF5),
                        foregroundColor: Colors.white,
                        fixedSize: const Size(280, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (_submitted && !_isAnswerCorrect)
              Text(
                'Incorrect! Try again.',
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xFF7A5DF5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              color: const Color(0xFF7A5DF5),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Question ${widget.startIndex + 1}/30',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.access_time, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    'Level ${widget.startIndex + 1}',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: isScrollable
                    ? LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: constraints.maxHeight),
                              child: IntrinsicHeight(child: content),
                            ),
                          );
                        },
                      )
                    : Column(
                        children: [Expanded(child: content)],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKey(String value) {
    IconData? icon;
    if (value == '<') icon = Icons.backspace_outlined;

    return SizedBox(
      width: 80,
      height: 48,
      child: ElevatedButton(
        onPressed: () => _handleKey(value),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: const BorderSide(color: Colors.grey),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4),
        ),
        child: icon != null
            ? Icon(icon)
            : Text(value, style: GoogleFonts.poppins(fontSize: 18)),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
