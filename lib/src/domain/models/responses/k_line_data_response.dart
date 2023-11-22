import 'package:equatable/equatable.dart';

/// {@template KLineData}
///
/// Gets k-line data of a single market.
///
/// * Signature required: No
/// * Max. return of 1000 records
///
/// {@endtemplate}
class KLineDataResponse extends Equatable {
  final List<KLineData> kLineDataList;

  /// {@macro KLineData}
  const KLineDataResponse({this.kLineDataList = const <KLineData>[]});

  /// {@macro KLineData}
  factory KLineDataResponse.fromMap(Map<String, dynamic> map) {
    var mapData = map['data'] ?? map;
    return KLineDataResponse(
      kLineDataList:
          (mapData as List).map((e) => KLineData.fromMap(e)).toList(),
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [kLineDataList];
}

/// {@macro KLineData}
class KLineData extends Equatable {
  final DateTime dateTime;
  final double openingPrice;
  final double closingPrice;
  final double highestPrice;
  final double lowestPrice;
  final double tradingVolume;
  final double tradingAmount;

  /// {@macro KLineData}
  const KLineData({
    required this.dateTime,
    required this.openingPrice,
    required this.closingPrice,
    required this.highestPrice,
    required this.lowestPrice,
    required this.tradingVolume,
    required this.tradingAmount,
  });

  /// {@macro KLineData}
  factory KLineData.fromMap(List<dynamic> map) {
    return KLineData(
      dateTime: DateTime.fromMillisecondsSinceEpoch(
        map[0] * 1000,
        isUtc: true,
      ).toLocal(),
      openingPrice: double.tryParse(map[1]) ?? 0.0,
      closingPrice: double.tryParse(map[2]) ?? 0.0,
      highestPrice: double.tryParse(map[3]) ?? 0.0,
      lowestPrice: double.tryParse(map[4]) ?? 0.0,
      tradingVolume: double.tryParse(map[5]) ?? 0.0,
      tradingAmount: double.tryParse(map[6]) ?? 0.0,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        dateTime,
        openingPrice,
        closingPrice,
        highestPrice,
        lowestPrice,
        tradingVolume,
        tradingAmount,
      ];
}
