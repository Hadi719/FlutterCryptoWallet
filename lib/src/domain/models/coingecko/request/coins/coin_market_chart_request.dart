/// {@template CoinMarketChart}
///
/// __Get historical market data include price, market cap, and 24h volume__
/// __(granularity auto)__
///
/// Data granularity is automatic (cannot be adjusted)
///   - 1 day from current time = 5 minute interval data
///   - 2 - 90 days from current time = hourly data
///   - above 90 days from current time = daily data (00:00 UTC)
///
/// Cache based on days range:
///
///   - 1 day = 30 seconds cache
///   - 2-90 days = 30 minutes cache
///   - 90 days = 12 hours cache
///
/// The last completed UTC day (00:00) is available 35 minutes after midnight on
/// the next UTC day (00:35). The cache will always expire at 00:40 UTC.
///
/// {@endtemplate}
class CoinMarketChartRequest {
  /// (Required) pass the coin id (can be obtained from /coins) eg. bitcoin
  final String id;

  /// (Required) The target currency of market data (usd, eur, jpy, etc.)
  final String vsCurrency;

  /// (Required) Data up to number of days ago (eg. 1,14,30,max)
  final int days;

  /// Data interval. Possible value: daily
  final String? interval;

  /// <b>full</b> or any value between 0 - 18 to specify decimal place for currency price value
  final String? precision;

  /// {@macro CoinMarketChart}
  const CoinMarketChartRequest({
    required this.id,
    this.vsCurrency = 'usd',
    this.days = 1,
    this.interval,
    this.precision,
  });
}
