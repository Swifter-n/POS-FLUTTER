import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playBeep() async {
    await _player.play(AssetSource('sounds/beep.mp3'));
  }

  static Future<void> playSuccess() async {
    await _player.play(AssetSource('sounds/success.mp3'));
  }

  static Future<void> playError() async {
    await _player.play(AssetSource('sounds/error.mp3'));
  }
}