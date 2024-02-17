class CoinHistoryRequest {
  /// (Required) pass the coin id (can be obtained from /coins) eg. bitcoin
  final String id;

  /// (Required) The date of data snapshot in dd-mm-yyyy eg. 30-12-2022
  final String date;

  /// Set to false to exclude localized languages in response
  final String? localization;

  const CoinHistoryRequest({
    required this.id,
    required this.date,
    this.localization,
  });
}
