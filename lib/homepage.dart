import 'package:flutter/material.dart';
import 'categories_page.dart';
import 'settings_page.dart';
import 'dailychallenge/daily_challenge_page.dart';

class HomePage extends StatelessWidget {
  final buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Math',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      Text(
                        'Riddles',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                _buildAnimatedButton(
                  onPressed: () {},
                  icon: Icons.play_circle_fill,
                  label: 'Play',
                  color: Colors.green,
                ),
                SizedBox(height: 15),
                _buildAnimatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DailyChallengePage()),
                    );
                  },
                  icon: Icons.calendar_today,
                  label: 'Daily Challenge',
                  color: Colors.blue,
                ),
                SizedBox(height: 15),
                _buildAnimatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoriesPage()),
                    );
                  },
                  icon: Icons.category,
                  label: 'Categories',
                  color: Colors.purple,
                ),
                SizedBox(height: 15),
                _buildAnimatedButton(
                  onPressed: () {},
                  icon: Icons.lock,
                  label: 'Premium',
                  color: Colors.amber,
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
                  color: Colors.grey.shade800,
                ),

                SizedBox(height: 15),
                _buildAnimatedButton(
                  onPressed: () {},
                  icon: Icons.exit_to_app,
                  label: 'Exit',
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
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
            onPressed: () {}, // keep non-null so color shows
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
