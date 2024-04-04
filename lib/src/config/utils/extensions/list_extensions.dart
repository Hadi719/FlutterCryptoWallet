import 'dart:math' as math show Random;

extension ListExtension<T> on List<T> {
  /// Gets an random item from the list
  T get randomElement => this[math.Random().nextInt(length)];

  /// Splits the list [at] index.
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}
