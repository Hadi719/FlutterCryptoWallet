/// Get the latest transaction data of a single market
class LatestTransactionDataRequest {
  /// It refers to [CryptoDetail.values.marketName]
  final String marketName;

  /// Transaction ID, 0 means get from the latest record.
  final int? lastId;

  /// Max 1000.
  ///
  /// Default value: 100.
  final int? limit;

  /// Get the latest transaction data of a single market
  const LatestTransactionDataRequest({
    required this.marketName,
    this.lastId,
    this.limit,
  });
}
