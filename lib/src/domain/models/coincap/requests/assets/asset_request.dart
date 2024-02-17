/// The asset price is a volume-weighted average calculated by collecting ticker
/// data from exchanges.
///
/// Each exchange contributes to this price in relation to their volume,
/// meaning higher volume exchanges have more affect on this global price.
/// All values are translated into USD (United States Dollar) and can be
/// translated into other units of measurement through the /rates endpoint
class AssetRequest {
  /// asset id
  ///
  /// required
  ///
  /// e.g. ___bitcoin___
  final String id;

  const AssetRequest({required this.id});
}
