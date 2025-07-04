import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MilestonePopup extends StatefulWidget {
  final int newTimerValue;
  final int level;

  const MilestonePopup({
    super.key,
    required this.newTimerValue,
    required this.level,
  });

  @override
  State<MilestonePopup> createState() => _MilestonePopupState();
}

class _MilestonePopupState extends State<MilestonePopup>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _ringController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _ringController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _colorAnimation = ColorTween(
      begin: Colors.pink,
      end: Color(0xFF7A5DF5),
    ).animate(_pulseController);

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _ringController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
              color: const Color(0xFF7A5DF5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              "You're Doing Great!",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBuilder(
                      animation: _ringController,
                      builder: (context, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: CircularProgressIndicator(
                                value: 1.0 - _ringController.value,
                                strokeWidth: 6,
                                backgroundColor: Color(
                                  0xFF7A5DF5,
                                ).withOpacity(0.1),
                                valueColor: AlwaysStoppedAnimation(
                                  Color(0xFF7A5DF5),
                                ),
                              ),
                            ),
                            ScaleTransition(
                              scale: _scaleAnimation,
                              child: CircleAvatar(
                                radius: 48,
                                backgroundColor: Color(
                                  0xFF7A5DF5,
                                ).withOpacity(0.1),
                                child: Icon(
                                  Icons.bar_chart,
                                  size: 44,
                                  color: Color(0xFF7A5DF5),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 28),
                    Text(
                      "Milestone Reached!",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "You've completed ${widget.level} questions",
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Level Up!",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Color(0xFF7A5DF5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.pink.shade50,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Timer will now decrease to",
                                  style: GoogleFonts.poppins(
                                    color: Colors.pink.shade800,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "${widget.newTimerValue - 1} seconds",
                                  style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: _colorAnimation.value,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Challenge increased!",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Color(0xFF7A5DF5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
