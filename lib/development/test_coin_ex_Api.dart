import 'package:flutter/material.dart';

import '../src/domain/models/coinex/crypto.dart';
import '../src/domain/models/requests/all_market_info_request.dart';
import '../src/domain/models/requests/all_market_list_request.dart';
import '../src/domain/models/requests/single_market_info_request.dart';
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
      future: const RemoteCoinEx().getAllMarketInfo(),
      builder: (context, snapshot) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Text(
              snapshot.hasData
                  ? snapshot.data.toString()
                  : snapshot.error.toString(),
              textScaleFactor: 1.5,
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
    final response = await serviceLocator<ApiRepository>().getAllMarketList(
      request: const AllMarketListRequest(),
    );
    if (response is DataSuccess) {
      print('SUCCESS: getAllMarketList');
      return response.data!.allMarketList;
    } else {
      print('FAILED: getAllMarketList');
      throw response.error!;
    }
  }

  Future<List<SingleMarketInfoResponse>> getAllMarketInfo() async {
    final response = await serviceLocator<ApiRepository>().getAllMarketInfo(
      request: const AllMarketInfoRequest(),
    );
    if (response is DataSuccess) {
      print('SUCCESS: getAllMarketInfo');
      return response.data!.singleMarketsInfo;
    } else {
      print('FAILED: getAllMarketInfo');
      throw response.error!;
    }
  }

  Future<SingleMarketInfoResponse> getSingleMarketInfo() async {
    final response = await serviceLocator<ApiRepository>().getSingleMarketInfo(
      request: SingleMarketInfoRequest(marketName: CryptoDetail.btc.marketName),
    );
    if (response is DataSuccess) {
      print('SUCCESS: getSingleMarketInfo');
      return response.data!;
    } else {
      print('FAILED: getSingleMarketInfo');
      throw response.error!;
    }
  }
}
