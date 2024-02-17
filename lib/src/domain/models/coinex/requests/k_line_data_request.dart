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

/// Defines k-line data type parameter.
enum KLineDataType {
  oneMin('1min'),
  threeMin('3min'),
  fiveMin('5min'),
  fifteenMin('15min'),
  thirtyMin('30min'),
  oneHour('1hour'),
  twoHour('2hour'),
  threeHour('3hour'),
  fourHour('4hour'),
  sixHour('6hour'),
  oneDay('1day'),
  threeDay('3day'),
  oneWeek('1week');

  final String value;

  const KLineDataType(this.value);
}
