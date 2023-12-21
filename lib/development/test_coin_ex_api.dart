import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'test_ce_bloc/test_ce_bloc.dart';

class TestCoinExApi extends StatelessWidget {
  const TestCoinExApi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<TestCeBloc>(
        create: (_) => TestCeBloc(),
        child: const _LayoutBuilder(),
      ),
    );
  }
}

class _LayoutBuilder extends StatelessWidget {
  const _LayoutBuilder();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocSelector<TestCeBloc, TestCeState, TestCeEvent?>(
          selector: (state) {
            return state.lastEvent;
          },
          builder: (context, state) {
            return Wrap(
              children: [
                ElevatedButton(
                  onPressed: state.runtimeType == TestCeAllMarketList
                      ? null
                      : () {
                          context.read<TestCeBloc>().add(TestCeAllMarketList());
                        },
                  child: const Text('AllMarketList'),
                ),
                ElevatedButton(
                  onPressed: state.runtimeType == TestCeAllMarketInfo
                      ? null
                      : () {
                          context.read<TestCeBloc>().add(TestCeAllMarketInfo());
                        },
                  child: const Text('AllMarketInfo'),
                ),
                ElevatedButton(
                  onPressed: state.runtimeType == TestCeSingleMarketInfo
                      ? null
                      : () {
                          context
                              .read<TestCeBloc>()
                              .add(TestCeSingleMarketInfo());
                        },
                  child: const Text('SingleMarketInfo'),
                ),
                ElevatedButton(
                  onPressed: state.runtimeType == TestCeMarketDepth
                      ? null
                      : () {
                          context.read<TestCeBloc>().add(TestCeMarketDepth());
                        },
                  child: const Text('MarketDepth'),
                ),
                ElevatedButton(
                  onPressed: state.runtimeType == TestCeLatestTransactionData
                      ? null
                      : () {
                          context
                              .read<TestCeBloc>()
                              .add(TestCeLatestTransactionData());
                        },
                  child: const Text('LatestTransactionData'),
                ),
                ElevatedButton(
                  onPressed: state.runtimeType == TestCeKLineData
                      ? null
                      : () {
                          context.read<TestCeBloc>().add(TestCeKLineData());
                        },
                  child: const Text('KLineData'),
                ),
                ElevatedButton(
                  onPressed: state.runtimeType == TestCeSingleMarketStatistics
                      ? null
                      : () {
                          context
                              .read<TestCeBloc>()
                              .add(TestCeSingleMarketStatistics());
                        },
                  child: const Text('SingleMarketStatistics'),
                ),
                ElevatedButton(
                  onPressed: state.runtimeType == TestCeAllMarketStatistics
                      ? null
                      : () {
                          context
                              .read<TestCeBloc>()
                              .add(TestCeAllMarketStatistics());
                        },
                  child: const Text('AllMarketStatistics'),
                ),
                ElevatedButton(
                  onPressed: state.runtimeType == TestCeCurrencyRate
                      ? null
                      : () {
                          context.read<TestCeBloc>().add(TestCeCurrencyRate());
                        },
                  child: const Text('CurrencyRate'),
                ),
              ],
            );
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<TestCeBloc, TestCeState>(
              builder: (BuildContext context, TestCeState state) {
                switch (state.status) {
                  case TestCeStatus.initial:
                    return const Center(
                      child: Text(
                        'Click a button',
                        style: TextStyle(color: Colors.green),
                      ),
                    );
                  case TestCeStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case TestCeStatus.failure:
                    return const Center(
                      child: Text(
                        'Failed to get data',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  case TestCeStatus.success:
                    return SingleChildScrollView(
                      child: Text(state.data.toString()),
                    );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
