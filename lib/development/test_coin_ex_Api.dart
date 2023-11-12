import 'package:flutter/material.dart';

import '../src/domain/models/requests/all_market_list_request.dart';
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
      future: const RemoteCoinEx().getAllMarketList(),
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
      return response.data!.allMarketList;
    } else {
      throw response.error!;
    }
  }
}
