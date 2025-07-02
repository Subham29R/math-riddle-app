import 'package:flutter/material.dart';

class HintOptionsDialog extends StatelessWidget {
  final VoidCallback onHintAd;
  final VoidCallback onSolutionAd;

  const HintOptionsDialog({
    super.key,
    required this.onHintAd,
    required this.onSolutionAd,
  });

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
            const Text(
              "Need Help?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            _buildOptionButton(
              icon: Icons.lightbulb,
              iconColor: Colors.purple,
              label: "Watch ads for hint",
              onTap: onHintAd,
            ),
            const SizedBox(height: 12),
            _buildOptionButton(
              icon: Icons.shield_outlined,
              iconColor: Colors.green,
              label: "Watch ads for solution",
              onTap: onSolutionAd,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.black54)),
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
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Icon(Icons.ondemand_video, color: Colors.amber.shade600),
          ],
        ),
      ),
    );
  }
}
