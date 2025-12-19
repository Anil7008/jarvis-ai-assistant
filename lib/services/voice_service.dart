import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceService {
  final FlutterTts _tts = FlutterTts();
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  
  bool _isListening = false;
  String _recognizedText = '';

  bool get isListening => _isListening;
  String get recognizedText => _recognizedText;

  Future<void> initializeSpeech() async {
    await _speechToText.initialize(
      onError: (error) => print('Error: \Could not find a part of the path 'C:\Users\OO7\jarvis-ai-assistant\lib\services\voice_service.dart'. The term 'q' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again. The term 'flutter' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again. The term 'flutter' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.'),
      onStatus: (status) => print('Status: \'),
    );
  }

  Future<void> startListening() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize();
      if (available) {
        _isListening = true;
        _speechToText.listen(
          onResult: (result) {
            _recognizedText = result.recognizedWords;
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
