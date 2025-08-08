import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathverse/sound_utils.dart';

class DailyChallengeResultPage extends StatefulWidget {
  final int streak;

  const DailyChallengeResultPage({super.key, required this.streak});

  @override
  State<DailyChallengeResultPage> createState() => _DailyChallengeResultPageState();
}

class _DailyChallengeResultPageState extends State<DailyChallengeResultPage>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late Duration _timeLeft;
  late AnimationController _iconController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    playSoundIfEnabled('sounds/success.mp3');
    _calculateTimeLeft();
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _iconController, curve: Curves.easeInOut),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _calculateTimeLeft();
    });
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    setState(() {
      _timeLeft = tomorrow.difference(now);
    });
  }

  String _formatTime(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    return "${hours.toString().padLeft(2, '0')}h "
        "${minutes.toString().padLeft(2, '0')}m "
        "${seconds.toString().padLeft(2, '0')}s";
  }

  @override
  void dispose() {
    _iconController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final streak = widget.streak;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3E9FF), Color(0xFFF8F5FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 100,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Correct Answer!🎉",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 115,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFB45EFF), Color(0xFF7A5DF5)],
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "$streak",
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Day Streak",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Keep it up! 🔥",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 65,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF89CFF0), Color(0xFF7A5DF5)],
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Next question unlocks in",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _formatTime(_timeLeft),
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "📅 Try again tomorrow!",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7A5DF5),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 140,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Home",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '“Success is the sum of small efforts repeated day in and day out.”',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
