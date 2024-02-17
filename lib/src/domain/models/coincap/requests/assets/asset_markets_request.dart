class AssetMarketsRequest {
  final String id;

  /// max limit of 2000
  final int? limit;

  final int? offset;

  const AssetMarketsRequest({
    required this.id,
    this.limit,
    this.offset,
  });
}
