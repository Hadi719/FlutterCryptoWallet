import 'package:freezed_annotation/freezed_annotation.dart';

part 'coins_markets_list_request.freezed.dart';
part 'coins_markets_list_request.g.dart';

enum CMLLocale {
  ar,
  bg,
  cs,
  da,
  de,
  el,
  en,
  es,
  fi,
  fr,
  he,
  hi,
  hr,
  hu,
  id,
  it,
  ja,
  ko,
  lt,
  nl,
  no,
  pl,
  pt,
  ro,
  ru,
  sk,
  sl,
  sv,
  th,
  tr,
  uk,
  vi,
  zh,
}

@JsonEnum(fieldRename: FieldRename.snake)
enum CMLOrder {
  marketCapAsc('market_cap_asc'),
  marketCapDesc('market_cap_desc'),
  volumeAsc('volume_asc'),
  volumeDesc('volume_desc'),
  idAsc('id_asc'),
  idDesc('id_desc');

  final String geckoKey;

  const CMLOrder(this.geckoKey);
}

@freezed
class CoinsMarketsListRequest with _$CoinsMarketsListRequest {
  const factory CoinsMarketsListRequest({
    /// (Required) The target currency of market data (usd, eur, jpy, etc.)
    @JsonKey(name: 'vs_currency', defaultValue: 'usd')
    required final String vsCurrency,

    /// The ids of the coin, comma separated cryptocurrency symbols (base). refers
    /// to `/coins/list`.
    final String? ids,

    /// filter by coin category. Refer to /coin/categories/list
    final String? category,

    /// valid values: <b>market\_cap\_asc, market\_cap\_desc, volume\_asc,
    /// volume\_desc, id\_asc, id\_desc</b>
    ///
    /// sort results by field.
    final CMLOrder? order,

    /// valid values: 1..250
    ///
    ///  Total results per page
    @JsonKey(name: 'per_page') final int? perPage,

    /// Page through results
    final int? page,

    /// Include sparkline 7 days data (eg. true, false)
    final String? sparkline,

    /// Include price change percentage in <b>1h, 24h, 7d, 14d, 30d, 200d, 1y</b>
    ///
    /// (eg. '`1h,24h,7d`' comma-separated, invalid values will be discarded)
    @JsonKey(name: 'price_change_percentage')
    final String? priceChangePercentage,

    /// valid values: <b>ar, bg, cs, da, de, el, en, es, fi, fr, he, hi, hr, hu,
    /// id, it, ja, ko, lt, nl, no, pl, pt, ro, ru, sk, sl, sv, th, tr, uk, vi,
    /// zh, zh-tw</b>
    ///
    /// Default value : en
    final CMLLocale? locale,

    /// <b>full</b> or any value between 0 - 18 to specify decimal place for
    /// currency price value
    final String? precision,
  }) = _CoinsMarketsListRequest;

  factory CoinsMarketsListRequest.fromJson(Map<String, dynamic> json) =>
      _$CoinsMarketsListRequestFromJson(json);
}
