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
  final DateTime dateTime;
  final double openingPrice;
  final double closingPrice;
  final double highestPrice;
  final double lowestPrice;
  final double tradingVolume;
  final double tradingAmount;

  /// {@macro KLineData}
  const KLineDataResponse({
    required this.dateTime,
    required this.openingPrice,
    required this.closingPrice,
    required this.highestPrice,
    required this.lowestPrice,
    required this.tradingVolume,
    required this.tradingAmount,
  });

  /// {@macro KLineData}
  factory KLineDataResponse.fromMap(List<dynamic> map) {
    return KLineDataResponse(
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
  String toString() {
    return '\n\n=======   $this   =======\n'
        'DateTime: $dateTime \n'
        'Opening Price: $openingPrice\n'
        'Closing Price: $closingPrice\n'
        'Highest Price: $highestPrice\n'
        'Lowest Price: $lowestPrice\n'
        'Trading Volume: $tradingVolume\n'
        'Trading Amount: $tradingAmount\n'
        '=============================';
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
}
