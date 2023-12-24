final class InvalidAgeException implements Exception {
  const InvalidAgeException();

  @override
  String toString() => 'Invalid age';
}

final class InvalidWeightException implements Exception {
  const InvalidWeightException();

  @override
  String toString() => 'Invalid weight';
}
