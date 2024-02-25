import 'package:freezed_annotation/freezed_annotation.dart';

part 'coins_markets_list_response.freezed.dart';
part 'coins_markets_list_response.g.dart';

@freezed
class CoinsMarketsListResponse with _$CoinsMarketsListResponse {
  const CoinsMarketsListResponse._();
  const factory CoinsMarketsListResponse({
    List<CoinMarketData>? data,
  }) = _CoinsMarketsListResponse;

  factory CoinsMarketsListResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinsMarketsListResponseFromJson(json);
}

@freezed
class CoinMarketData with _$CoinMarketData {
  const factory CoinMarketData({
    String? id,
    String? symbol,
    String? name,
    String? image,
    @JsonKey(name: 'current_price') double? currentPrice,
    @JsonKey(name: 'market_cap') double? marketCap,
    @JsonKey(name: 'market_cap_rank') int? marketCapRank,
    @JsonKey(name: 'fully_diluted_valuation') double? fullyDilutedValuation,
    @JsonKey(name: 'total_volume') double? totalVolume,
    @JsonKey(name: 'high_24h') double? high24h,
    @JsonKey(name: 'low_24h') double? low24h,
    @JsonKey(name: 'price_change_24h') double? priceChange24h,
    @JsonKey(name: 'price_change_percentage_24h')
    double? priceChangePercentage24h,
    @JsonKey(name: 'market_cap_change_24h') double? marketCapChange24h,
    @JsonKey(name: 'market_cap_change_percentage_24h')
    double? marketCapChangePercentage24h,
    @JsonKey(name: 'circulating_supply') double? circulatingSupply,
    @JsonKey(name: 'total_supply') double? totalSupply,
    @JsonKey(name: 'max_supply') double? maxSupply,
    double? ath,
    @JsonKey(name: 'ath_change_percentage') double? athChangePercentage,
    @JsonKey(name: 'ath_date') String? athDate,
    double? atl,
    @JsonKey(name: 'atl_change_percentage') double? atlChangePercentage,
    @JsonKey(name: 'atl_date') String? atlDate,
    Map<String, dynamic>? roi,
    @JsonKey(name: 'last_updated') String? lastUpdated,
    @JsonKey(name: 'sparkline_in_7d') Map<String, dynamic>? sparklineIn7day,
    @JsonKey(name: 'price_change_percentage_1h_in_currency')
    double? priceChangePercentage1hInCurrency,
    @JsonKey(name: 'price_change_percentage_24h_in_currency')
    double? priceChangePercentage24hInCurrency,
    @JsonKey(name: 'price_change_percentage_7d_in_currency')
    double? priceChangePercentage7dInCurrency,
    @JsonKey(name: 'price_change_percentage_14d_in_currency')
    double? priceChangePercentage14dInCurrency,
    @JsonKey(name: 'price_change_percentage_30d_in_currency')
    double? priceChangePercentage30dInCurrency,
    @JsonKey(name: 'price_change_percentage_200d_in_currency')
    double? priceChangePercentage200dInCurrency,
    @JsonKey(name: 'price_change_percentage_1y_in_currency')
    double? priceChangePercentage1yInCurrency,
  }) = _CoinMarketData;

  factory CoinMarketData.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketDataFromJson(json);
}
