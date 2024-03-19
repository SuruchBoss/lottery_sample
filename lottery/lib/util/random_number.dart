import 'dart:math';

String generateRandomWithFixedDigits(String pattern) {
  Random random = Random();
  List<String> result = List<String>.filled(pattern.length, '0');

  for (int i = 0; i < pattern.length; i++) {
    if (pattern[i] == 'x') {
      result[i] = random.nextInt(10).toString();
    } else {
      result[i] = pattern[i];
    }
  }

  return result.join('');
}
