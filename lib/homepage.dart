import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'categories_page.dart';
import 'settings_page.dart';
import 'dailychallenge/daily_challenge_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hardmaths/hardmath_quiz_page.dart';
import 'package:mathverse/riddles/riddle_quiz_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  final buttonTextStyle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Placeholder URLs - update these when your app is hosted
  static const String _appStoreUrl = 'https://apps.apple.com/app/your-app-id';
  static const String _playStoreUrl = 'https://play.google.com/store/apps/details?id=com.example.mathverse';
  static const String _appWebsite = 'https://your-app-website.com';

  void _shareApp(BuildContext context) {
    try {
      Share.share(
        'Check out MathVerse - an amazing math riddle and speed challenge app! 🧮✨\n\n'
        'Download now: $_appWebsite\n\n'
        'Challenge your mind with:\n'
        '• Quick Maths - Fast-paced arithmetic\n'
        '• Riddles - Brain teasers & logic puzzles\n'
        '• Hard Maths - Advanced mathematical problems\n'
        '• Daily Challenges - New puzzles every day\n\n'
        '#MathVerse #MathGames #BrainTraining',
        subject: 'MathVerse - Math Riddles & Speed Challenges',
      );
    } catch (e) {
      // Show error dialog if sharing fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFFF3F0FE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Unable to Share',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
          content: Text(
            'Please try sharing again or copy the app link manually.',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7A5DF5),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  void _rateApp(BuildContext context) async {
    try {
      // Try to open the appropriate store based on platform
      final Uri url;
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        url = Uri.parse(_appStoreUrl);
      } else {
        url = Uri.parse(_playStoreUrl);
      }

      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        // Fallback: show a dialog with the URL
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color(0xFFF3F0FE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              'Rate MathVerse',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            content: Text(
              'Please visit our store page to rate the app:\n\n$url',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'OK',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7A5DF5),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Show error dialog if something goes wrong
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFFF3F0FE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Unable to Open Store',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
          content: Text(
            'Please manually search for "MathVerse" in your app store to rate us.',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7A5DF5),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7A5DF5), Color(0xFF4D2DB7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Math',
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                          ),
                          Text(
                            'Verse',
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Riddles & Speed',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                _buildAnimatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final section = prefs.getString('lastPlayedSection');
                    final index = prefs.getInt('lastPlayedIndex') ?? 0;
                    final riddleCompleted =
                        prefs.getInt('riddle_completed') ?? 0;
                    final hardMathCompleted =
                        prefs.getInt('hardMath_completed') ?? 0;

                    final isFirstTime =
                        section == null &&
                        riddleCompleted == 0 &&
                        hardMathCompleted == 0;

                    if (isFirstTime) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoriesPage(),
                          settings: RouteSettings(name: '/categories'),
                        ),
                      );
                    } else if (riddleCompleted >= 50 &&
                        hardMathCompleted >= 30) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: const Color(0xFFF3F0FE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: Text(
                              "Congratulations!",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black87,
                              ),
                            ),
                            content: Text(
                              "You’ve successfully completed all Riddle and Hard Math challenges!",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("OK", style: GoogleFonts.poppins()),
                              ),
                            ],
                          );
                        },
                      );
                    } else if (section == 'hardMath') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HardMathQuizPage(startIndex: index),
                        ),
                      );
                    } else if (section == 'riddle') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RiddleQuizPage(startIndex: index),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesPage(),
                          settings: RouteSettings(name: '/categories'),
                        ),
                      );
                    }
                  },
                  icon: Icons.play_circle_fill,
                  label: 'Play',
                  color: Color(0xFF43A047),
                ),
                SizedBox(height: 15),
                _buildAnimatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DailyChallengePage(),
                      ),
                    );
                  },
                  icon: Icons.calendar_today,
                  label: 'Daily Challenge',
                  color: Color(0xFF1E88E5),
                ),
                SizedBox(height: 15),
                _buildAnimatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoriesPage(),
                        settings: RouteSettings(name: '/categories'),
                      ),
                    );
                  },
                  icon: Icons.category,
                  label: 'Categories',
                  color: Color(0xFF8E24AA),
                ),
                SizedBox(height: 15),
                _buildAnimatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                  icon: Icons.settings,
                  label: 'Settings',
                  color: Color(0xFF424242),
                ),

                SizedBox(height: 15),
                _buildAnimatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xFFF3F0FE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Text(
                            "Exit App",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                          content: Text(
                            "Are you sure you want to exit?",
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          actionsPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          actionsAlignment: MainAxisAlignment.spaceEvenly,
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF43A047),
                                foregroundColor: Colors.white,
                                elevation: 4,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFE53935),
                                foregroundColor: Colors.white,
                                elevation: 4,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                SystemNavigator.pop();
                              },
                              child: Text("Exit", style: GoogleFonts.poppins()),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icons.exit_to_app,
                  label: 'Exit',
                  color: Color(0xFFE53935),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _rateApp(context),
                        icon: Icon(Icons.star, color: Colors.white),
                        label: Text(
                          'Rate Us',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFB8C00),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _shareApp(context),
                        icon: Icon(Icons.share, color: Colors.white),
                        label: Text(
                          'Share',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF039BE5),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCompletedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "You’re a Champion!",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        content: Text(
          "You’ve completed all questions. Explore more in Categories!",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoriesPage(),
                  settings: RouteSettings(name: '/categories'),
                ),
              );
            },
            child: Text("Go to Categories", style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return _TapEffectButton(
      onPressed: onPressed,
      icon: icon,
      label: label,
      color: color,
      textStyle: buttonTextStyle,
    );
  }
}

class _TapEffectButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color color;
  final TextStyle textStyle;

  const _TapEffectButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.color,
    required this.textStyle,
  });

  @override
  State<_TapEffectButton> createState() => _TapEffectButtonState();
}

class _TapEffectButtonState extends State<_TapEffectButton> {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 0.95);
  void _onTapUp(_) => setState(() => _scale = 1.0);
  void _onTapCancel() => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: 120),
        child: AbsorbPointer(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(widget.icon, color: Colors.white),
            label: Text(widget.label, style: widget.textStyle),
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              minimumSize: Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
