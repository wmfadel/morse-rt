import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class MorseProvider with ChangeNotifier {
  Map<String, String> charToCode = const {
    "0": "-----",
    "1": ".----",
    "2": "..---",
    "3": "...--",
    "4": "....-",
    "5": ".....",
    "6": "-....",
    "7": "--...",
    "8": "---..",
    "9": "----.",
    "a": ".-",
    "b": "-...",
    "c": "-.-.",
    "d": "-..",
    "e": ".",
    "f": "..-.",
    "g": "--.",
    "h": "....",
    "i": "..",
    "j": ".---",
    "k": "-.-",
    "l": ".-..",
    "m": "--",
    "n": "-.",
    "o": "---",
    "p": ".--.",
    "q": "--.-",
    "r": ".-.",
    "s": "...",
    "t": "-",
    "u": "..-",
    "v": "...-",
    "w": ".--",
    "x": "-..-",
    "y": "-.--",
    "z": "--..",
    ".": ".-.-.-",
    ",": "--..--",
    "?": "..--..",
    "!": "-.-.--",
    "-": "-....-",
    "/": "-..-.",
    "@": ".--.-.",
    "(": "-.--.",
    ")": "-.--.-"
  };

  String codeToChar(String code) {
    if (code == '#') return ' ';
    String character = '';
    try {
      character = charToCode.keys.firstWhere(
          (element) => charToCode[element] == code,
          orElse: () => '');
    } on Exception catch (_) {
      character = '';
    }

    return character;
  }

  BehaviorSubject<String> _codeToCharSubject = BehaviorSubject();
  Stream<String> get codeToCharStream => _codeToCharSubject.stream;

  addCode(String code) {
    String message = _codeToCharSubject.value ?? '';
    _codeToCharSubject.add(message + codeToChar(code));
  }
}
