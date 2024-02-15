/// {@template AssetPlatformsList}
///
/// List all asset platforms
///
/// {@endtemplate}
class AssetPlatformsListRequest {
  /// {@macro AssetPlatformsList}
  const AssetPlatformsListRequest({this.filter});

  /// apply relevant filters to results
  ///
  /// valid values: "nft" (asset_platform nft-support)
  final String? filter;
}
