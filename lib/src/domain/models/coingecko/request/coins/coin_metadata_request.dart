/// Gets current coin data (name, price, market, images, ... including exchange tickers) for a coin.
///
/// - Ticker object is limited to 100 items, to get more tickers, use /coins/{id}/tickers
/// - Ticker is_stale is true when ticker that has not been updated/unchanged from the exchange for more than 8 hours.
/// - Ticker is_anomaly is true if ticker's price is outliered by our system.
/// - You are responsible for managing how you want to display these information (e.g. footnote, different background, change opacity, hide)
///
/// Note: to check if a price is stale, please refer to last_updated of the price.
class CoinMetadataRequest {
  const CoinMetadataRequest({
    required this.id,
    this.localization,
    this.tickers,
    this.marketData,
    this.communityData,
    this.developerData,
    this.sparkline,
  });

  /// pass the coin id (can be obtained from /coins) eg. bitcoin
  final String id;

  /// Include all localized languages in response (true/false) [default: true]
  final String? localization;

  /// Include tickers data (true/false) [default: true]
  final bool? tickers;

  /// Include market_data (true/false) [default: true]
  final bool? marketData;

  /// Include community_data data (true/false) [default: true]
  final bool? communityData;

  /// Include developer_data data (true/false) [default: true]
  final bool? developerData;

  /// Include sparkline 7 days data (eg. true, false) [default: false]
  final bool? sparkline;
}
