import '../../src/domain/models/coinex/crypto.dart';
import 'single_market_statistics.dart';

/// {@template AllMarketStatistics}
///
/// a list of [SingleMarketStatistics]
///
/// * Signature required: No
///
/// {@endtemplate}
class AllMarketStatistics {
  static const String urlPath = '/market/ticker/all';

  final List<SingleMarketStatistics> data;

  final DateTime? dateTime;

  /// {@macro AllMarketStatistics}
  AllMarketStatistics({required this.data, this.dateTime});

  factory AllMarketStatistics.fromJson(Map<String, dynamic> jsonData) {
    List<SingleMarketStatistics> myList = [];
    int? time = jsonData['date'];
    Map<String, dynamic> dataMap = jsonData['ticker'];
    dataMap.forEach((key, value) {
      CoinExCryptoDetail cryptoDetail = CoinExCryptoDetail.fromMarketName(key);
      if (cryptoDetail != CoinExCryptoDetail.unknown) {
        myList.add(
          SingleMarketStatistics.fromAllMarket(
            value,
            cryptoDetail: cryptoDetail,
            time: time,
          ),
        );
      }
    });

    return AllMarketStatistics(
      data: myList,
      dateTime: time != null
          ? DateTime.fromMillisecondsSinceEpoch(time)
          : DateTime.now(),
    );
  }

  @override
  String toString() {
    return data.toString();
  }
}
