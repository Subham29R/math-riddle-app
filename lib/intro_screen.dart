import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  void _onIntroEnd(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenIntro', true);

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: Text(
            "Welcome to MathVerse!",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bodyWidget: Text(
            "Sharpen your brain with fun puzzles and tricky challenges.",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          image: Center(
            child: Icon(
              Icons.auto_awesome,
              size: 150,
              color: Colors.deepPurple,
            ),
          ),
        ),

        PageViewModel(
          titleWidget: Text(
            "Daily Challenges",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bodyWidget: Text(
            "Test yourself every day with a fresh challenge to boost your brainpower.",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          image: Center(
            child: Icon(Icons.calendar_today, size: 150, color: Colors.green),
          ),
        ),

        PageViewModel(
          titleWidget: Text(
            "Quick Maths",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bodyWidget: Text(
            "Answer simple math questions super fast — you've got just 10 seconds!",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          image: Center(
            child: Icon(Icons.flash_on, size: 150, color: Colors.orange),
          ),
        ),

        PageViewModel(
          titleWidget: Text(
            "Riddles",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bodyWidget: Text(
            "Use your logic to crack image-based and tricky brain teasers!",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          image: Center(
            child: Icon(Icons.psychology, size: 150, color: Colors.pinkAccent),
          ),
        ),

        PageViewModel(
          titleWidget: Text(
            "Hard Math",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bodyWidget: Text(
            "Level up your thinking with tougher puzzles that need logic and skill.",
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          image: Center(
            child: Icon(Icons.calculate, size: 150, color: Colors.redAccent),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skip: Text("Skip", style: GoogleFonts.poppins()),
      next: Icon(Icons.arrow_forward),
      done: Text(
        "Done",
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
      dotsDecorator: DotsDecorator(
        activeColor: Color(0xFF7A5DF5),
        size: Size.square(8.0),
        activeSize: Size(16.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
