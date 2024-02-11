import 'package:freezed_annotation/freezed_annotation.dart';

part 'coins_markets_list_response.freezed.dart';
part 'coins_markets_list_response.g.dart';

@freezed
class CoinsMarketsListResponse with _$CoinsMarketsListResponse {
  const factory CoinsMarketsListResponse(
    List<Map<String, dynamic>>? coinsMarketsDataList,
  ) = _CoinsMarketsListResponse;

  factory CoinsMarketsListResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinsMarketsListResponseFromJson(json);
}

@freezed
class CoinMarketData with _$CoinMarketData {
  const factory CoinMarketData(
    String? id,
    String? symbol,
    String? name,
    String? image,
    @JsonKey(name: 'current_price') String? currentPrice,
    @JsonKey(name: 'market_cap') String? marketCap,
    @JsonKey(name: 'market_cap_rank') String? marketCapRank,
    @JsonKey(name: 'fully_diluted_valuation') String? fullyDilutedValuation,
    @JsonKey(name: 'total_volume') String? totalVolume,
    @JsonKey(name: 'high_24h') String? high24h,
    @JsonKey(name: 'low_24h') String? low24h,
    @JsonKey(name: 'price_change_24h') String? priceChange24h,
    @JsonKey(name: 'price_change_percentage_24h')
    String? priceChangePercentage24h,
    @JsonKey(name: 'market_cap_change_24h') String? marketCapChange24h,
    @JsonKey(name: 'market_cap_change_percentage_24h')
    String? marketCapChangePercentage24h,
    @JsonKey(name: 'circulating_supply') String? circulatingSupply,
    @JsonKey(name: 'total_supply') String? totalSupply,
    @JsonKey(name: 'max_supply') String? maxSupply,
    String? ath,
    @JsonKey(name: 'ath_change_percentage') String? athChangePercentage,
    @JsonKey(name: 'ath_date') String? athDate,
    String? atl,
    @JsonKey(name: 'atl_change_percentage') String? atlChangePercentage,
    @JsonKey(name: 'atl_date') String? atlDate,
    String? roi,
    @JsonKey(name: 'last_updated') String? lastUpdated,
  ) = _CoinMarketData;

  factory CoinMarketData.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketDataFromJson(json);
}
