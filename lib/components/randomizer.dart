import 'dart:math';

int numberGenerator(int min, int max) {
  var random = Random();
  return min + random.nextInt(max - min);
}
