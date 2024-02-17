/// {@template CoinOHLC}
///
/// __Candle's body - data granularity is automatic (cannot be adjusted for__
/// __public api users):__
///
/// Data granularity is automatic (cannot be adjusted)
///   - 1 - 2 days: 30 minutes
///   - 3 - 30 days: 4 hours
///   - 31 days and beyond: 4 days
///
/// Daily candle interval parameter is available for paid plan users only
/// (Analyst/Lite/Pro/Enterprise), use interval=daily parameter in your request:
///
///   - 'daily' interval: available for 1/7/14/30/90/180 days
///
/// Cache / Update Frequency: every 30 minutes
///
/// The last completed UTC day (00:00) is available 35 minutes after midnight on
/// the next UTC day (00:35).
///
/// {@endtemplate}
class CoinOHLCRequest {
  /// (Required) pass the coin id (can be obtained from /coins) eg. bitcoin
  final String id;

  /// (Required) The target currency of market data (usd, eur, jpy, etc.)
  final String vsCurrency;

  /// (Required)  Data up to number of days ago (1/7/14/30/90/180/365/max)
  final int days;

  /// <b>full</b> or any value between 0 - 18 to specify decimal place for currency price value
  final String? precision;

  /// {@macro CoinOHLC}
  const CoinOHLCRequest({
    required this.id,
    this.vsCurrency = 'usd',
    this.days = 7,
    this.precision,
  });
}
