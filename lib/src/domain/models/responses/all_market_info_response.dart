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
  /// {@macro AllMarketInfoResponse}
  const AllMarketInfoResponse({required this.singleMarketsInfo});

  final List<SingleMarketInfoResponse> singleMarketsInfo;

  /// {@macro AllMarketInfoResponse}
  factory AllMarketInfoResponse.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> mapData = map['data'] ?? map;
    var selected = _getSelected(mapData);
    return AllMarketInfoResponse(
      singleMarketsInfo: List.from(
        selected.map(
          (e) => SingleMarketInfoResponse.fromMap(e.value),
        ),
      ),
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [singleMarketsInfo];
}

List<MapEntry<String, dynamic>> _getSelected(Map<String, dynamic> map) {
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
