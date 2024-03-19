import 'package:equatable/equatable.dart';

class SimplePricesListResponse extends Equatable {
  final Map<String, dynamic> pricesList;

  const SimplePricesListResponse({this.pricesList = const {}});

  factory SimplePricesListResponse.fromJson(Map<String, dynamic> mapData) {
    return SimplePricesListResponse(pricesList: mapData);
  }

  @override
  List<Object?> get props => [pricesList];

  @override
  bool get stringify => true;

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
}

enum SimplePriceValue {
  price(''),
  marketCap('_market_cap'),
  volume24h('_24h_vol'),
  change24h('_24h_change'),
  lastUpdatedAt('last_updated_at');

  final String keyString;

  const SimplePriceValue(this.keyString);
}
