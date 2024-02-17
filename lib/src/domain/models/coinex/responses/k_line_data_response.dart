import 'package:equatable/equatable.dart';

import '../../../../utils/constants/strings.dart';

/// {@macro KLineData}
class KLineData extends Equatable {
  final DateTime dateTime;
  final double? openingPrice;
  final double? closingPrice;
  final double? highestPrice;
  final double? lowestPrice;
  final double? tradingVolume;
  final double? tradingAmount;

  /// {@macro KLineData}
  const KLineData({
    required this.dateTime,
    this.openingPrice,
    this.closingPrice,
    this.highestPrice,
    this.lowestPrice,
    this.tradingVolume,
    this.tradingAmount,
  });

  /// {@macro KLineData}
  factory KLineData.fromMap(List<dynamic> map) {
    return KLineData(
      dateTime: DateTime.fromMillisecondsSinceEpoch(
        map[0] * 1000,
        isUtc: true,
      ).toLocal(),
      openingPrice: double.tryParse(map[1] ?? kDoubleRevoker),
      closingPrice: double.tryParse(map[2] ?? kDoubleRevoker),
      highestPrice: double.tryParse(map[3] ?? kDoubleRevoker),
      lowestPrice: double.tryParse(map[4] ?? kDoubleRevoker),
      tradingVolume: double.tryParse(map[5] ?? kDoubleRevoker),
      tradingAmount: double.tryParse(map[6] ?? kDoubleRevoker),
    );
  }

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

  @override
  bool? get stringify => true;
}

/// {@template KLineData}
///
/// Gets k-line data of a single market.
///
/// * Signature required: No
/// * Max. return of 1000 records
///
/// {@endtemplate}
class KLineDataResponse extends Equatable {
  /// List of [KLineData].
  final List<KLineData> data;

  /// {@macro KLineData}
  const KLineDataResponse({this.data = const <KLineData>[]});

  /// {@macro KLineData}
  factory KLineDataResponse.fromMap(Map<String, dynamic> map) {
    var mapData = map['data'] ?? map;
    return KLineDataResponse(
      data: (mapData as List).map((e) => KLineData.fromMap(e)).toList(),
    );
  }

  @override
  List<Object?> get props => [data];

  @override
  bool? get stringify => true;
}
