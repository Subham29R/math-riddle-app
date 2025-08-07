import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

final AudioPlayer _globalAudioPlayer = AudioPlayer();

Future<void> playSoundIfEnabled(String path) async {
  final prefs = await SharedPreferences.getInstance();
  final isSoundOn = prefs.getBool('sound') ?? true;

  if (isSoundOn) {
    try {
      await _globalAudioPlayer.stop(); 
      await _globalAudioPlayer.play(AssetSource(path));
    } catch (_) {
      
    }
  }
}
