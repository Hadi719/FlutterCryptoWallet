import 'package:flutter/material.dart';

import '../src/domain/models/coinex/crypto.dart';
import '../src/domain/models/requests/all_market_info_request.dart';
import '../src/domain/models/requests/all_market_list_request.dart';
import '../src/domain/models/requests/k_line_data_request.dart';
import '../src/domain/models/requests/latest_transaction_data_request.dart';
import '../src/domain/models/requests/market_depth_request.dart';
import '../src/domain/models/requests/single_market_info_request.dart';
import '../src/domain/models/responses/all_market_info_response.dart';
import '../src/domain/models/responses/all_market_list_response.dart';
import '../src/domain/models/responses/k_line_data_response.dart';
import '../src/domain/models/responses/latest_transaction_data_response.dart';
import '../src/domain/models/responses/market_depth_response.dart';
import '../src/domain/models/responses/single_market_info_response.dart';
import '../src/domain/repositories/api_repository.dart';
import '../src/service_locator.dart';
import '../src/utils/resources/data_state.dart';

class TestCoinExApi extends StatefulWidget {
  const TestCoinExApi({super.key});

  @override
  State<TestCoinExApi> createState() => _TestCoinExApiState();
}

class _TestCoinExApiState extends State<TestCoinExApi> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: const RemoteCoinEx().getKLineData(),
      builder: (BuildContext context, snapshot) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Text(
              snapshot.hasData
                  ? snapshot.data.toString()
                  : snapshot.error.toString(),
              textScaler: const TextScaler.linear(1.5),
            ),
          ),
        );
      },
    );
  }
}

class RemoteCoinEx {
  const RemoteCoinEx();

  Future<List<String>> getAllMarketList() async {
    final DataState<AllMarketListResponse> response =
        await serviceLocator<ApiRepository>().getAllMarketList(
      request: const AllMarketListRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAllMarketList');
      return response.data!.allMarketList;
    } else {
      debugPrint('FAILED: $getAllMarketList');
      throw response.error!;
    }
  }

  Future<List<SingleMarketInfoResponse>> getAllMarketInfo() async {
    final DataState<AllMarketInfoResponse> response =
        await serviceLocator<ApiRepository>().getAllMarketInfo(
      request: const AllMarketInfoRequest(),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getAllMarketInfo');
      return response.data!.singleMarketsInfo;
    } else {
      debugPrint('FAILED: $getAllMarketInfo');
      throw response.error!;
    }
  }

  Future<SingleMarketInfoResponse> getSingleMarketInfo() async {
    final DataState<SingleMarketInfoResponse> response =
        await serviceLocator<ApiRepository>().getSingleMarketInfo(
      request: SingleMarketInfoRequest(marketName: CryptoDetail.btc.marketName),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getSingleMarketInfo');
      return response.data!;
    } else {
      debugPrint('FAILED: $getSingleMarketInfo');
      throw response.error!;
    }
  }

  Future<MarketDepthResponse> getMarketDepth() async {
    final DataState<MarketDepthResponse> response =
        await serviceLocator<ApiRepository>().getMarketDepth(
      request: MarketDepthRequest(
        marketName: CryptoDetail.btc.marketName,
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getMarketDepth');
      return response.data!;
    } else {
      debugPrint('FAILED: $getMarketDepth');
      throw response.error!;
    }
  }

  Future<LatestTransactionDataResponse> getLatestTransactionData() async {
    final DataState<LatestTransactionDataResponse> response =
        await serviceLocator<ApiRepository>().getLatestTransactionData(
      request: LatestTransactionDataRequest(
        marketName: CryptoDetail.btc.marketName,
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getLatestTransactionData');
      return response.data!;
    } else {
      debugPrint('FAILED: $getLatestTransactionData');
      throw response.error!;
    }
  }

  Future<KLineDataResponse> getKLineData() async {
    final DataState<KLineDataResponse> response =
        await serviceLocator<ApiRepository>().getKLineData(
      request: KLineDataRequest(
        marketName: CryptoDetail.btc.marketName,
      ),
    );
    if (response is DataSuccess) {
      debugPrint('SUCCESS: $getKLineData');
      return response.data!;
    } else {
      debugPrint('FAILED: $getKLineData');
      throw response.error!;
    }
  }
}
