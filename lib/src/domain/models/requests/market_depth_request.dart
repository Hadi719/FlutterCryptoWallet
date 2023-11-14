/// Gets market depth in a single market
class MarketDepth {
  const MarketDepth({
    required this.marketName,
    this.merge = MarketDepthMerge.oneOneHundredth,
    this.limit,
  });

  final String marketName;

  final MarketDepthMerge merge;

  /// Has Default value of 20.
  final MarketDepthLimit? limit;
}

enum MarketDepthMerge {
  zero('0'),
  oneTenth('0.1'),
  oneOneHundredth('0.01'),
  oneOneThousandth('0.001'),
  oneTenThousandth('0.0001'),
  oneOneHundredThousandth('0.00001'),
  oneOneMillionth('0.000001'),
  oneTenMillionth('0.0000001'),
  oneOneHundredMillionth('0.00000001');

  final String value;

  const MarketDepthMerge(this.value);
}

enum MarketDepthLimit {
  five(5),
  ten(10),
  twenty(20),
  fifty(50);

  final int value;
  const MarketDepthLimit(this.value);
}
