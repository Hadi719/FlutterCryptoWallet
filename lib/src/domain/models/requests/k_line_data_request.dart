/// Gets k-line data of a single market.
class KLineDataRequest {
  /// It refers to [CryptoDetail.values.marketName]
  final String marketName;

  /// Max: 1000
  ///
  /// Default 100.
  final int? limit;

  final KLineDataType type;

  const KLineDataRequest({
    required this.marketName,
    this.limit,
    this.type = KLineDataType.oneDay,
  });
}

enum KLineDataType {
  oneMin,
  threeMin,
  fiveMin,
  fifteenMin,
  thirtyMin,
  oneHour,
  twoHour,
  threeHour,
  fourHour,
  sixHour,
  oneDay,
  threeDay,
  oneWeek,
}
