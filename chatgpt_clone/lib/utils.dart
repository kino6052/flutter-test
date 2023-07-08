import 'dart:math';

String generateId() {
  var random = Random();
  var uniqueId =
      '${DateTime.now().millisecondsSinceEpoch}${random.nextInt(10000)}';
  return uniqueId;
}
