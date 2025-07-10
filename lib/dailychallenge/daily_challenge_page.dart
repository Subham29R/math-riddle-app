import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'daily_challenge_data.dart';
import 'daily_challenge_result_page.dart';
import 'daily_hint_options_dialog.dart';

class DailyChallengePage extends StatefulWidget {
  const DailyChallengePage({super.key});

  @override
  State<DailyChallengePage> createState() => _DailyChallengePageState();
}

class _DailyChallengePageState extends State<DailyChallengePage> {
  final TextEditingController _controller = TextEditingController();
  int _streak = 0;
  DateTime? _lastPlayedDate;
  int _index = 0;
  bool _hasWatchedHint = false;
  bool _submitted = false;
  bool _isAnswerCorrect = false;

  @override
  void initState() {
    super.initState();
    _initializeChallenge();
    _controller.addListener(() {
      setState(() {});
    });
  }

  Future<void> _initializeChallenge() async {
    final prefs = await SharedPreferences.getInstance();

    final savedStreak = prefs.getInt('dailyChallengeStreak') ?? 0;
    final savedDate = prefs.getString('lastCompletedDate');
    if (savedDate != null) {
      _lastPlayedDate = DateTime.tryParse(savedDate);
    }

    setState(() {
      _streak = savedStreak;
    });

    String? startDateStr = prefs.getString('dailyChallengeStartDate');
    if (startDateStr == null) {
      final today = DateTime.now();
      await prefs.setString('dailyChallengeStartDate', today.toIso8601String());
      startDateStr = today.toIso8601String();
    }

    final startDate = DateTime.parse(startDateStr);
    final daysPassed = DateTime.now().difference(startDate).inDays;
    setState(() {
      _index = daysPassed % dailyQuestions.length;
    });
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

  Future<void> _submitAnswer() async {
    final prefs = await SharedPreferences.getInstance();
    final current = dailyQuestions[_index];
    final userAnswer = _controller.text.trim();
    final correctAnswer = current.answer.trim();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final savedDateString = prefs.getString('lastCompletedDate');
    final lastPlayed =
        savedDateString != null ? DateTime.tryParse(savedDateString) : null;

    bool alreadyPlayedToday = lastPlayed != null && lastPlayed == today;
    final isCorrect = userAnswer == correctAnswer;

    setState(() {
      _submitted = true;
      _isAnswerCorrect = isCorrect;
    });

    if (!isCorrect) return;

    int updatedStreak = _streak;

    if (!alreadyPlayedToday) {
      if (lastPlayed != null && today.difference(lastPlayed).inDays == 1) {
        updatedStreak += 1;
      } else {
        updatedStreak = 1;
      }

      await prefs.setString('lastCompletedDate', today.toIso8601String());
      await prefs.setInt('dailyChallengeStreak', updatedStreak);
    }

    if (!mounted) return;

    Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => DailyChallengeResultPage(
      streak: updatedStreak, 
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
            side: const BorderSide(color: Color.fromARGB(255, 110, 109, 109)),
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
  Widget build(BuildContext context) {
    final current = dailyQuestions[_index];
    final isImageQuestion = _index < 10;
    final question = current.question;
    final hint = current.hint;
    final solution = current.solution;
    final imagePath = current.imagePath;

    final content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const SizedBox(height: 8),
            if (isImageQuestion && imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.contain,
                ),
              )
            else
              Text(
                question,
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
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
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => DailyHintOptionsDialog(
                    onHintAd: () {
                      setState(() => _hasWatchedHint = true);
                    },
                    onSolutionAd: () {},
                    hintText: hint,
                    solutionText: solution,
                    hasWatchedHint: _hasWatchedHint,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lightbulb_outline, size: 20),
                  const SizedBox(width: 8),
                  Text("Hint", style: GoogleFonts.poppins(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          children: [
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
                          : _submitAnswer,
                      icon: const Icon(Icons.check),
                      label: Text(
                        'Enter',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
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
            const SizedBox(height: 8),
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
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Daily Challenge',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: isImageQuestion
                    ? SingleChildScrollView(child: content)
                    : content,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
