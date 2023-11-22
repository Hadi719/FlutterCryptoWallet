import 'package:equatable/equatable.dart';

import '../coinex/crypto.dart' show CryptoDetail;
import 'single_market_info_response.dart';

/// {@template AllMarketInfoResponse}
///
/// a list of all Markets info.
///
/// * Signature required: No
///
/// {@endtemplate}
class AllMarketInfoResponse extends Equatable {
  final List<SingleMarketInfoResponse> singleMarketInfoList;

  /// {@macro AllMarketInfoResponse}
  const AllMarketInfoResponse({required this.singleMarketInfoList});

  /// {@macro AllMarketInfoResponse}
  factory AllMarketInfoResponse.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> mapData = map['data'] ?? map;
    var cryptos = _getNeededCryptos(mapData);
    return AllMarketInfoResponse(
      singleMarketInfoList: List.from(
        cryptos.map(
          (e) => SingleMarketInfoResponse.fromMap(e.value),
        ),
      ),
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [singleMarketInfoList];
}

/// Gets only the cryptos from [CryptoDetail].
List<MapEntry<String, dynamic>> _getNeededCryptos(Map<String, dynamic> map) {
  var allCrypto = CryptoDetail.values.toList();
  var selected = map.entries
      .where(
        (item) => allCrypto.any(
          (element) => element.marketName == item.key,
        ),
      )
      .toList();
  return selected;
}
