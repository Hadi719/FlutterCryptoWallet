/// Gets statistics on a single market.
class SingleMarketStatisticsRequest {
  /// It refers to [CryptoDetail.values.marketName]
  final String marketName;

  /// Gets statistics on a single market.
  const SingleMarketStatisticsRequest({required this.marketName});
}
