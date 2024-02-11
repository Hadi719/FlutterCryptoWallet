import 'package:equatable/equatable.dart';

class SimplePricesListResponse extends Equatable {
  const SimplePricesListResponse({this.pricesList = const {}});

  final Map<String, dynamic> pricesList;

  @override
  List<Object?> get props => [pricesList];

  factory SimplePricesListResponse.fromJson(Map<String, dynamic> mapData) {
    return SimplePricesListResponse(pricesList: mapData);
  }

  num? getValue({
    required String coinId,
    required String vsCurrency,
    required SimplePriceValue simplePriceValue,
  }) {
    MapEntry<String, dynamic>? selected = pricesList[coinId]
        ?.entries
        .firstWhere(
          (element) => simplePriceValue == SimplePriceValue.lastUpdatedAt
              ? element.key == SimplePriceValue.lastUpdatedAt.keyString
              : simplePriceValue == SimplePriceValue.price
                  ? element.key == vsCurrency
                  : element.key == '$vsCurrency${simplePriceValue.keyString}',
        );

    return selected?.value;
  }

  @override
  bool get stringify => true;
}

enum SimplePriceValue {
  price(''),
  marketCap('_market_cap'),
  volume24h('_24h_vol'),
  change24h('_24h_change'),
  lastUpdatedAt('last_updated_at');

  const SimplePriceValue(this.keyString);

  final String keyString;
}

/*class SimplePriceResponse extends Equatable {
  const SimplePriceResponse({
    this.coinId,
    this.price,
    this.marketCap,
    this.volume24h,
    this.change24h,
    this.lastUpdatedAt,
  });
  final String? coinId;
  final double? price;
  final double? marketCap;
  final double? volume24h;
  final double? change24h;
  final int? lastUpdatedAt;

  factory SimplePriceResponse.fromMap(
    String key,
    Map<String, dynamic> mapData,
    String vsCurrency,
  ) {
    String? coinId;
    double? price;
    double? marketCap;
    double? volume24h;
    double? change24h;
    int? lastUpdatedAt;

    for (MapEntry<String, dynamic> element in mapData.entries) {
      // switch(element.key  ) {
      //   case :
      //
      //     break;
      //   default:
      // }
    }

    return SimplePriceResponse(
      coinId: coinId,
      price: price,
      marketCap: marketCap,
      volume24h: volume24h,
      change24h: change24h,
      lastUpdatedAt: lastUpdatedAt,
    );
  }

  @override
  List<Object?> get props => [
        coinId,
        price,
        marketCap,
        volume24h,
        change24h,
        lastUpdatedAt,
      ];

  @override
  bool get stringify => true;
}*/
