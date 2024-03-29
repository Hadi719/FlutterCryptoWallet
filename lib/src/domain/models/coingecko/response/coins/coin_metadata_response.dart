import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_metadata_response.freezed.dart';
part 'coin_metadata_response.g.dart';

@freezed
class CoinMetadataResponse with _$CoinMetadataResponse {
  const factory CoinMetadataResponse({
    String? id,
    String? symbol,
    String? name,
    @JsonKey(name: 'web_slug') String? webSlug,
    @JsonKey(name: 'asset_platform_id') dynamic assetPlatformId,
    Map<String, dynamic>? platforms,
    @JsonKey(name: 'detail_platforms') Map<String, dynamic>? detailPlatforms,
    @JsonKey(name: 'block_time_in_minutes') int? blockTimeInMinutes,
    @JsonKey(name: 'hashing_algorithm') String? hashingAlgorithm,
    List<String>? categories,
    @JsonKey(name: 'preview_listing') bool? previewListing,
    @JsonKey(name: 'public_notice') dynamic publicNotice,
    @JsonKey(name: 'additional_notices') dynamic additionalNotices,
    Map<String, dynamic>? localization,
    Map<String, dynamic>? description,
    Map<String, dynamic>? links,
    Map<String, dynamic>? image,
    @JsonKey(name: 'country_origin') String? countryOrigin,
    @JsonKey(name: 'genesis_date') String? genesisDate,
    @JsonKey(name: 'sentiment_votes_up_percentage')
    double? sentimentVotesUpPercentage,
    @JsonKey(name: 'sentiment_votes_down_percentage')
    double? sentimentVotesDownPercentage,
    @JsonKey(name: 'watchlist_portfolio_users') int? watchlistPortfolioUsers,
    @JsonKey(name: 'market_cap_rank') int? marketCapRank,
    @JsonKey(name: 'market_data') Map<String, dynamic>? marketData,
    @JsonKey(name: 'community_data') Map<String, dynamic>? communityData,
    @JsonKey(name: 'developer_data') Map<String, dynamic>? developerData,
    @JsonKey(name: 'status_updates') List<dynamic>? statusUpdates,
    @JsonKey(name: 'last_updated') String? lastUpdated,
    List<dynamic>? tickers,
  }) = _CoinMetadataResponse;

  factory CoinMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinMetadataResponseFromJson(json);
}
