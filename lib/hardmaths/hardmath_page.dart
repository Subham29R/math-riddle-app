import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hardMath_quiz_page.dart';

class HardMathsPage extends StatefulWidget {
  const HardMathsPage({super.key});

  @override
  State<HardMathsPage> createState() => _HardMathsPageState();
}

class _HardMathsPageState extends State<HardMathsPage> {
  int completedLevels = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadProgress();
  }

  @override
  void didUpdateWidget(covariant HardMathsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final progress = prefs.getInt('hardMath_completed') ?? 0;

    if (mounted && progress != completedLevels) {
      setState(() {
        completedLevels = progress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A5DF5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7A5DF5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Math Challenge',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Divider(color: Colors.white, height: 1),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Progress',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$completedLevels/50 Levels',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF7A5DF5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  height: 16,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: completedLevels / 50,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF7A5DF5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  itemCount: 50,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    final level = index + 1;
                    final isCompleted = level <= completedLevels;
                    final isCurrent = level == completedLevels + 1;
                    final isLocked = level > completedLevels + 1;

                    return ElevatedButton(
                      onPressed:
                          isLocked
                              ? null
                              : () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) =>
                                            HardMathQuizPage(startIndex: index),
                                  ),
                                );
                                await _loadProgress();
                              },

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isCurrent
                                ? Colors.red
                                : isCompleted
                                ? Colors.green
                                : Colors.grey.shade300,
                        foregroundColor:
                            isLocked ? Colors.grey.shade600 : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child:
                          isLocked
                              ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.lock,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$level',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              )
                              : Text(
                                '$level',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                    );
                  },
                ),
              ),
            ),
          ),
          const Divider(height: 1),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Level',
                      style: GoogleFonts.poppins(color: Colors.black54),
                    ),
                    Text(
                      'Level ${completedLevels + 1}',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => HardMathQuizPage(startIndex: completedLevels),
                      ),
                    );
                    await _loadProgress();
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7A5DF5),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Play Now',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
