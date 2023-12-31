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
  /// {@macro AllMarketStatistics}
  AllMarketStatistics({required this.data, this.dateTime});

  static const String urlPath = '/market/ticker/all';

  final List<SingleMarketStatistics> data;
  final DateTime? dateTime;

  factory AllMarketStatistics.fromJson(Map<String, dynamic> jsonData) {
    List<SingleMarketStatistics> myList = [];
    int? time = jsonData['date'];
    Map<String, dynamic> dataMap = jsonData['ticker'];
    dataMap.forEach((key, value) {
      CryptoDetail cryptoDetail = CryptoDetail.fromMarketName(key);
      if (cryptoDetail != CryptoDetail.unknown) {
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
