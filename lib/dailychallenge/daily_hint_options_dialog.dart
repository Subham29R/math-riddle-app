import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'daily_info_dialog.dart';

class DailyHintOptionsDialog extends StatefulWidget {
  final VoidCallback onHintAd;
  final VoidCallback onSolutionAd;
  final String hintText;
  final String solutionText;
  final bool hasWatchedHint;

  const DailyHintOptionsDialog({
    super.key,
    required this.onHintAd,
    required this.onSolutionAd,
    required this.hintText,
    required this.solutionText,
    required this.hasWatchedHint,
  });

  @override
  State<DailyHintOptionsDialog> createState() => _DailyHintOptionsDialogState();
}

class _DailyHintOptionsDialogState extends State<DailyHintOptionsDialog> {
  late bool _hasWatchedHint = widget.hasWatchedHint;
  bool _showError = false;

  void _handleHint() {
    widget.onHintAd();
    setState(() {
      _hasWatchedHint = true;
      _showError = false;
    });

    Navigator.of(context).pop();
    Future.delayed(const Duration(milliseconds: 150), () {
      showDialog(
        context: context,
        builder:
            (_) => DailyInfoDialog(
              title: "Hint",
              content: widget.hintText,
              icon: Icons.lightbulb_outline,
              color: Colors.amber,
            ),
      );
    });
  }

  void _handleSolution() {
    if (!_hasWatchedHint) {
      setState(() {
        _showError = true;
      });
      return;
    }

    widget.onSolutionAd();
    Navigator.of(context).pop();

    Future.delayed(const Duration(milliseconds: 150), () {
      showDialog(
        context: context,
        builder:
            (_) => DailyInfoDialog(
              title: "Solution",
              content: widget.solutionText,
              icon: Icons.check_circle_outline,
              color: Colors.green,
            ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Need Help?",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 24),
            _buildBoxButton(
              label: "Show Hint",
              icon: Icons.lightbulb_outline,
              color: Colors.amber,
              onTap: _handleHint,
            ),
            const SizedBox(height: 16),
            _buildBoxButton(
              label: "Show Solution",
              icon: Icons.check_circle_outline,
              color: Colors.green,
              onTap: _handleSolution,
            ),
            if (_showError) ...[
              const SizedBox(height: 12),
              Text(
                "⚠ You need to watch the hint first!",
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBoxButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        width: 200, 
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
