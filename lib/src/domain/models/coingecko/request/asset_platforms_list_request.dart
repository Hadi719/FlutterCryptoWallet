/// {@template AssetPlatformsList}
///
/// List all asset platforms
///
/// {@endtemplate}
class AssetPlatformsListRequest {
  /// apply relevant filters to results
  ///
  /// valid values: "nft" (asset_platform nft-support)
  final String? filter;

  /// {@macro AssetPlatformsList}
  const AssetPlatformsListRequest({this.filter});
}
