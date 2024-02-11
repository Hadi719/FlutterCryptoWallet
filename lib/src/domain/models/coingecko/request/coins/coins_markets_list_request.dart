class CoinsMarketsListRequest {
  CoinsMarketsListRequest({
    required this.vsCurrency,
    this.ids,
    this.category,
    this.order,
    int? perPage,
    this.page,
    this.sparkline,
    this.priceChangePercentage,
    this.locale,
    this.precision,
  }) : perPage = perPage?.clamp(1, 250);

  /// (Required) The target currency of market data (usd, eur, jpy, etc.)
  final String vsCurrency;

  /// The ids of the coin, comma separated crytocurrency symbols (base). refers
  /// to `/coins/list`.
  final String? ids;

  /// filter by coin category. Refer to /coin/categories/list
  final String? category;

  /// valid values: <b>market\_cap\_asc, market\_cap\_desc, volume\_asc,
  /// volume\_desc, id\_asc, id\_desc</b>
  ///
  /// sort results by field.
  final CMLOrder? order;

  /// valid values: 1..250
  ///
  ///  Total results per page
  final int? perPage;

  /// Page through results
  final int? page;

  /// Include sparkline 7 days data (eg. true, false)
  final String? sparkline;

  /// Include price change percentage in <b>1h, 24h, 7d, 14d, 30d, 200d, 1y</b>
  ///
  /// (eg. '`1h,24h,7d`' comma-separated, invalid values will be discarded)
  final String? priceChangePercentage;

  /// valid values: <b>ar, bg, cs, da, de, el, en, es, fi, fr, he, hi, hr, hu,
  /// id, it, ja, ko, lt, nl, no, pl, pt, ro, ru, sk, sl, sv, th, tr, uk, vi,
  /// zh, zh-tw</b>
  ///
  /// Default value : en
  final CMLLocale? locale;

  /// <b>full</b> or any value between 0 - 18 to specify decimal place for
  /// currency price value
  final String? precision;
}

enum CMLOrder {
  marketCapASC('market_cap_asc'),
  marketCapDESC('market_cap_desc'),
  volumeASC('volume_asc'),
  volumeDESC('volume_desc'),
  idASC('id_asc'),
  idDESC('id_desc');

  const CMLOrder(this.value);
  final String value;
}

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
