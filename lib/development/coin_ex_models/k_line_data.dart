import '../../src/utils/constants/strings.dart';

/// {@template KLineData}
///
/// k-line data of a single market.
///
/// * Signature required: No
/// * Max. return of 1000 records
///
/// {@endtemplate}
class KLineData {
  static const urlPath = '/market/kline';
  final DateTime dateTime;

  final double? openingPrice;
  final double? closingPrice;
  final double? highestPrice;
  final double? lowestPrice;
  final double? tradingVolume;
  final double? tradingAmount;

  /// {@macro KLineData}
  KLineData({
    required this.dateTime,
    this.openingPrice,
    this.closingPrice,
    this.highestPrice,
    this.lowestPrice,
    this.tradingVolume,
    this.tradingAmount,
  });

  factory KLineData.fromJson(List<dynamic> jsonData) {
    return KLineData(
      dateTime: DateTime.fromMillisecondsSinceEpoch(
        jsonData[0] * 1000,
        isUtc: true,
      ).toLocal(),
      openingPrice: double.tryParse(jsonData[1] ?? kDoubleRevoker),
      closingPrice: double.tryParse(jsonData[2] ?? kDoubleRevoker),
      highestPrice: double.tryParse(jsonData[3] ?? kDoubleRevoker),
      lowestPrice: double.tryParse(jsonData[4] ?? kDoubleRevoker),
      tradingVolume: double.tryParse(jsonData[5] ?? kDoubleRevoker),
      tradingAmount: double.tryParse(jsonData[6] ?? kDoubleRevoker),
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
}
