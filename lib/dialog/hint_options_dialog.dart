import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'riddle_info_dialog.dart';
import 'animated_action_button.dart';

class HintOptionsDialog extends StatefulWidget {
  final VoidCallback onHintAd;
  final VoidCallback onSolutionAd;
  final String hintText;
  final String solutionText;
  final bool hasWatchedHint;

  const HintOptionsDialog({
    super.key,
    required this.onHintAd,
    required this.onSolutionAd,
    required this.hintText,
    required this.solutionText,
    required this.hasWatchedHint,
  });

  @override
  State<HintOptionsDialog> createState() => _HintOptionsDialogState();
}

class _HintOptionsDialogState extends State<HintOptionsDialog> {
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
            (_) => RiddleInfoDialog(title: "Hint", message: widget.hintText),
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
            (_) => RiddleInfoDialog(
              title: "Solution",
              message: widget.solutionText,
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Need Help?",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            _buildOptionButton(
              icon: Icons.lightbulb,
              iconColor: Colors.purple,
              label: "Watch ads for hint",
              onTap: _handleHint,
            ),
            const SizedBox(height: 12),
            _buildOptionButton(
              icon: Icons.shield_outlined,
              iconColor: Colors.green,
              label: "Watch ads for solution",
              onTap: _handleSolution,
            ),
            if (_showError) ...[
              const SizedBox(height: 10),
              Text(
                "⚠ You need to watch the hint first!",
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            const SizedBox(height: 20),
            AnimatedActionButton(
              text: "Cancel",
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required IconData icon,
    required Color iconColor,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor.withOpacity(0.1),
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
            ),
            Icon(Icons.ondemand_video, color: Colors.amber.shade600),
          ],
        ),
      ),
    );
  }
}
