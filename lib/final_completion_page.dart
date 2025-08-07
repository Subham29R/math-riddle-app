import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import 'categories_page.dart';

class FinalCompletionPage extends StatefulWidget {
  @override
  State<FinalCompletionPage> createState() => _FinalCompletionPageState();
}

class _FinalCompletionPageState extends State<FinalCompletionPage>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _iconController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 5));
    _confettiController.play();

    _iconController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _iconController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              blastDirectionality: BlastDirectionality.directional,
              emissionFrequency: 0.12,
              numberOfParticles: 40,
              maxBlastForce: 25,
              minBlastForce: 10,
              gravity: 0.2,
              shouldLoop: false,
              colors: [
                Color(0xFF7A5DF5),
                Color(0xFFBA68C8),
                Color(0xFF9575CD),
                Color(0xFF4FC3F7),
                Color(0xFFFFB74D),
              ],
              createParticlePath: (size) {
                final path = Path();
                path.addPolygon([
                  Offset(0, -5),
                  Offset(5, 5),
                  Offset(-5, 5),
                ], true);
                return path;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _glowAnimation,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF7A5DF5), Color(0xFFD0B3FF)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF7A5DF5).withOpacity(0.6),
                          blurRadius: 20,
                          spreadRadius: 4,
                        )
                      ],
                    ),
                    child: Icon(
                      Icons.emoji_events,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Congratulations!",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7A5DF5),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "You've completed 100 Quick Math questions.",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  "Get ready for a more challenging adventure ahead!",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => CategoriesPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7A5DF5),
                    foregroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Back to Categories",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
