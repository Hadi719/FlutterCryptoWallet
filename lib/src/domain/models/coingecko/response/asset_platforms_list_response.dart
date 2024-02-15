import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_platforms_list_response.freezed.dart';
part 'asset_platforms_list_response.g.dart';

/// {@macro AssetPlatformsList}
@Freezed(toJson: false, fromJson: false)
class AssetPlatformsListResponse with _$AssetPlatformsListResponse {
  /// {@macro AssetPlatformsList}
  const factory AssetPlatformsListResponse({
    List<AssetPlatformResponse>? assetPlatformsList,
  }) = _AssetPlatformsListResponse;

  /// {@macro AssetPlatformsList}
  factory AssetPlatformsListResponse.fromJson(Map<String, dynamic> json) =>
      AssetPlatformsListResponse(
        assetPlatformsList: (json['assetPlatformsList'] as List<dynamic>?)
            ?.map(
              (e) => AssetPlatformResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );
}

@Freezed(toJson: false)
class AssetPlatformResponse with _$AssetPlatformResponse {
  const factory AssetPlatformResponse({
    String? id,
    @JsonKey(name: 'chain_identifier') int? chainIdentifier,
    String? name,
    String? shortname,
    @JsonKey(name: 'native_coin_id') String? nativeCoinId,
  }) = _AssetPlatformResponse;

  factory AssetPlatformResponse.fromJson(Map<String, dynamic> json) =>
      _$AssetPlatformResponseFromJson(json);
}
