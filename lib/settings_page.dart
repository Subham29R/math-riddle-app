import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:restart_app/restart_app.dart';
=======
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSoundOn = true;
  String themeMode = "Light mode";

  @override
<<<<<<< HEAD
  void initState() {
    super.initState();
    _loadSoundSetting();
  }

  void _loadSoundSetting() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isSoundOn = prefs.getBool('sound') ?? true;
    });
  }

  void _updateSoundSetting(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sound', value);
    setState(() {
      isSoundOn = value;
    });
  }

  void _launchEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'mathverse790@gmail.com',
    query: Uri.encodeFull('subject=Contact Support&body=Hi, I need help with...'),
  );

  try {
    final launched = await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    if (!launched && mounted) _showNoAppDialog();
  } catch (_) {
    if (mounted) _showNoAppDialog();
  }
}

void _showNoAppDialog() {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("No Email App Found", style: GoogleFonts.poppins()),
      content: Text(
        "Please install or enable an email app to contact us.",
        style: GoogleFonts.poppins(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("OK", style: GoogleFonts.poppins()),
        ),
      ],
    ),
  );
}



  @override
=======
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1
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
<<<<<<< HEAD
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: Text(
                        "Reset Progress",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      content: Text(
                        "Are you sure you want to reset all your progress?",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                      actionsPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7A5DF5),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.of(context).pop(); 

                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder:
                                  (_) => Container(
                                    color: Colors.black.withOpacity(0.2),
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: Color(0xFF7A5DF5),
                                        strokeWidth: 4,
                                      ),
                                    ),
                                  ),
                            );

                            final prefs = await SharedPreferences.getInstance();
                            await prefs.clear();

                            await Future.delayed(const Duration(seconds: 1));
                            Restart.restartApp();
                          },
                          child: Text(
                            "Reset",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

=======
              onTap: () {},
            ),
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1
            buildToggleCardTile(
              icon: Icons.volume_up,
              title: "Sound",
              value: isSoundOn,
              iconBackgroundColor: const Color(0xFF7A5DF5).withOpacity(0.1),
              onChanged: (value) {
<<<<<<< HEAD
                _updateSoundSetting(value);
              },
            ),
            buildCardTile(
              icon: Icons.mail_outline,
              title: "Contact Us",
              iconBackgroundColor: const Color(0xFF7A5DF5).withOpacity(0.1),
              onTap: _launchEmail,
=======
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
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1
            ),
            const Spacer(),
            Column(
              children: [
                Text(
<<<<<<< HEAD
=======
                  "App Version 2.1.0",
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1
                  "Made with 💜",
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
                const SizedBox(height: 20),
              ],
<<<<<<< HEAD
            ),
=======
            )
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1
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
<<<<<<< HEAD
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
=======
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          title: Text(title, style: GoogleFonts.poppins()),
<<<<<<< HEAD
          subtitle:
              subtitle != null
                  ? Text(subtitle, style: GoogleFonts.poppins())
                  : null,
=======
          subtitle: subtitle != null
              ? Text(subtitle, style: GoogleFonts.poppins())
              : null,
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1
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
<<<<<<< HEAD
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
=======
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
>>>>>>> 4fdf84c0d4977d0f207eaca1662db8d5ee2820b1
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
