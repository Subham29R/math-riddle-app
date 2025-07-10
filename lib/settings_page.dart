import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSoundOn = true;
  String themeMode = "Light mode";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7A5DF5),
        elevation: 0,
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildCardTile(
              icon: Icons.refresh,
              title: "Reset Progress",
              iconColor: Colors.redAccent,
              iconBackgroundColor: Colors.redAccent.withOpacity(0.1),
              onTap: () {},
            ),
            buildToggleCardTile(
              icon: Icons.volume_up,
              title: "Sound",
              value: isSoundOn,
              iconBackgroundColor: const Color(0xFF7A5DF5).withOpacity(0.1),
              onChanged: (value) {
                setState(() {
                  isSoundOn = value;
                });
              },
            ),
            buildCardTile(
              icon: Icons.brightness_6,
              title: "Theme",
              subtitle: themeMode,
              iconBackgroundColor: const Color(0xFF7A5DF5).withOpacity(0.1),
              onTap: () {},
            ),
            buildCardTile(
              icon: Icons.mail_outline,
              title: "Contact Us",
              iconBackgroundColor: const Color(0xFF7A5DF5).withOpacity(0.1),
              onTap: () {},
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  "App Version 2.1.0",
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  "Made with 💜",
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
                const SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCardTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    Color iconColor = const Color(0xFF7A5DF5),
    Color iconBackgroundColor = const Color(0xFFF3F0FE),
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          title: Text(title, style: GoogleFonts.poppins()),
          subtitle: subtitle != null
              ? Text(subtitle, style: GoogleFonts.poppins())
              : null,
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget buildToggleCardTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    Color iconColor = const Color(0xFF7A5DF5),
    Color iconBackgroundColor = const Color(0xFFF3F0FE),
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          title: Text(title, style: GoogleFonts.poppins()),
          trailing: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF7A5DF5),
          ),
        ),
      ),
    );
  }
}
