/// {@template KLineData}
///
/// k-line data of a single market.
///
/// * Signature required: No
/// * Max. return of 1000 records
///
/// {@endtemplate}
class KLineData {
  /// {@macro KLineData}
  KLineData({
    required this.dateTime,
    required this.openingPrice,
    required this.closingPrice,
    required this.highestPrice,
    required this.lowestPrice,
    required this.tradingVolume,
    required this.tradingAmount,
  });
  static const urlPath = '/market/kline';

  final DateTime dateTime;
  final double openingPrice;
  final double closingPrice;
  final double highestPrice;
  final double lowestPrice;
  final double tradingVolume;
  final double tradingAmount;

  factory KLineData.fromJson(List<dynamic> jsonData) {
    return KLineData(
      dateTime: DateTime.fromMillisecondsSinceEpoch(
        jsonData[0] * 1000,
        isUtc: true,
      ).toLocal(),
      openingPrice: double.tryParse(jsonData[1]) ?? 0.0,
      closingPrice: double.tryParse(jsonData[2]) ?? 0.0,
      highestPrice: double.tryParse(jsonData[3]) ?? 0.0,
      lowestPrice: double.tryParse(jsonData[4]) ?? 0.0,
      tradingVolume: double.tryParse(jsonData[5]) ?? 0.0,
      tradingAmount: double.tryParse(jsonData[6]) ?? 0.0,
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
