import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceService {
  final FlutterTts _tts = FlutterTts();
  final SpeechToText _speechToText = SpeechToText();
  bool _isListening = false;

  Future<void> initializeSpeechToText() async {
    await _speechToText.initialize(
      onStatus: (status) => print('Status: $status'),
      onError: (error) => print('Error: $error'),
    );
  }

  Future<void> startListening(Function(String) onResult) async {
    if (!_isListening) {
      bool available = await _speechToText.initialize();
      if (available) {
        _isListening = true;
        _speechToText.listen(
          onResult: (result) {
            onResult(result.recognizedWords);
          },
        );
      }
    }
  }

  void stopListening() {
    if (_isListening) {
      _speechToText.stop();
      _isListening = false;
    }
  }

  Future<void> speak(String text) async {
    await _tts.speak(text);
  }

  Future<void> dispose() async {
    await _tts.stop();
    await _speechToText.cancel();
  }
}
