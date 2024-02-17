import 'package:equatable/equatable.dart';

import '../crypto.dart';
import 'single_market_info_response.dart';

/// Gets only the cryptos from [CoinExCryptoDetail].
List<MapEntry<String, dynamic>> _getNeededCryptos(Map<String, dynamic> map) {
  List<CoinExCryptoDetail> allCrypto = CoinExCryptoDetail.values.toList();
  var selected = map.entries
      .where(
        (item) => allCrypto.any(
          (element) => element.marketName == item.key,
        ),
      )
      .toList();
  return selected;
}

/// {@template AllMarketInfoResponse}
///
/// a list of all Markets info.
///
/// * Signature required: No
///
/// {@endtemplate}
class AllMarketInfoResponse extends Equatable {
  /// List of [SingleMarketInfoResponse].
  final List<SingleMarketInfoResponse> data;

  /// {@macro AllMarketInfoResponse}
  const AllMarketInfoResponse({required this.data});

  /// {@macro AllMarketInfoResponse}
  factory AllMarketInfoResponse.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> mapData = map['data'] ?? map;
    var cryptos = _getNeededCryptos(mapData);
    return AllMarketInfoResponse(
      data: List.from(
        cryptos.map(
          (e) => SingleMarketInfoResponse.fromMap(e.value),
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [data];

  @override
  bool? get stringify => true;
}
