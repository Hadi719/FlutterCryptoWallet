import 'package:equatable/equatable.dart';

import '../crypto.dart';
import 'single_market_statistics_response.dart';

/// {@template AllMarketStatistics}
///
/// a list of [SingleMarketStatistics]
///
/// * Signature required: No
///
/// {@endtemplate}
class AllMarketStatisticsResponse extends Equatable {
  /// List of [SingleMarketStatisticsResponse].
  final List<SingleMarketStatisticsResponse> data;
  final DateTime? dateTime;

  /// {@macro AllMarketStatistics}
  const AllMarketStatisticsResponse({required this.data, this.dateTime});

  /// {@macro AllMarketStatistics}
  factory AllMarketStatisticsResponse.fromMap(Map<String, dynamic> map) {
    List<SingleMarketStatisticsResponse> myList = [];
    int? time = map['data']['date'];
    Map<String, dynamic> dataMap = map['data']['ticker'];
    CoinExCryptoDetail cryptoDetail = CoinExCryptoDetail.unknown;

    dataMap.forEach((key, value) {
      cryptoDetail = CoinExCryptoDetail.fromMarketName(key);
      if (cryptoDetail != CoinExCryptoDetail.unknown) {
        myList.add(
          SingleMarketStatisticsResponse.fromAllMarket(
            value,
            cryptoDetail: cryptoDetail,
            time: time,
          ),
        );
      }
    });

    return AllMarketStatisticsResponse(
      data: myList,
      dateTime: time != null
          ? DateTime.fromMillisecondsSinceEpoch(time)
          : DateTime.now(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, dateTime];
}
