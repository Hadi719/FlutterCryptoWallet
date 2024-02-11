/// {@template CoinMarketChartRange}
///
/// __Get historical market data include price, market cap, and 24h volume__
/// __(granularity auto)__
///
/// Data granularity is automatic (cannot be adjusted)
///   - 1 day from current time = 5 minute interval data
///   - 2 - 90 days from current time = hourly data
///   - above 90 days from current time = daily data (00:00 UTC)
///
/// Cache / Update Frequency: every 5 minutes.
///
/// The last completed UTC day (00:00) is available 35 minutes after midnight on
/// the next UTC day (00:35).
///
/// {@endtemplate}
class CoinMarketChartRangeRequest {
  /// {@macro CoinMarketChartRange}
  const CoinMarketChartRangeRequest({
    required this.id,
    this.vsCurrency = 'usd',
    required this.from,
    required this.to,
    this.precision,
  });

  /// (Required) pass the coin id (can be obtained from /coins) eg. bitcoin
  final String id;

  /// (Required) The target currency of market data (usd, eur, jpy, etc.)
  final String vsCurrency;

  /// (Required) From date in UNIX Timestamp (eg. 1392577232)
  final int from;

  /// (Required) To date in UNIX Timestamp (eg. 1422577232)
  final int to;

  /// <b>full</b> or any value between 0 - 18 to specify decimal place for currency price value
  final String? precision;
}
