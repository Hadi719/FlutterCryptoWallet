import 'package:freezed_annotation/freezed_annotation.dart';

part 'coins_markets_list_response.freezed.dart';
part 'coins_markets_list_response.g.dart';

@Freezed(toJson: false)
class CoinsMarketsListResponse with _$CoinsMarketsListResponse {
  const factory CoinsMarketsListResponse({
    List<CoinMarketData>? coins,
  }) = _CoinsMarketsListResponse;

  factory CoinsMarketsListResponse.fromJson(Map<String, Object?> json) =>
      _$CoinsMarketsListResponseFromJson(json);
}

@Freezed(toJson: false)
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
  }) = _CoinMarketData;

  factory CoinMarketData.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketDataFromJson(json);
}
/*
/// A JsonConverter for [CoinsMarketsListResponse.coins]
class CoinMarketDataConverter
    implements JsonConverter<List<CoinMarketData>?, Map<String, dynamic>> {
  /// A JsonConverter for [CoinsMarketsListResponse.coins]
  const CoinMarketDataConverter();

  @override
  List<CoinMarketData>? fromJson(Map<String, dynamic> json) {
    var coinValues = json.values;
    List<CoinMarketData> coins =
        List.from(coinValues.map((e) => CoinMarketData.fromJson(e)).toList());
    return coins;
  }

  @override
  Map<String, dynamic> toJson(List<CoinMarketData>? object) => {};
}*/
