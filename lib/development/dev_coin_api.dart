import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dev_coin_bloc/dev_coin_bloc.dart';

class DevCoinApi extends StatelessWidget {
  const DevCoinApi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<DevCoinBloc>(
        create: (_) => DevCoinBloc(),
        child: const _LayoutBuilder(),
      ),
    );
  }
}

class _LayoutBuilder extends StatelessWidget {
  const _LayoutBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _ChangeIcon(
          onPressed: () {
            context.read<DevCoinBloc>().add(DevCoinChangeApi());
          },
        ),
        centerTitle: true,
        elevation: 8.0,
        title: Text(
          context.select((DevCoinBloc bloc) =>
              bloc.state.coinApi == CoinApi.coinCap ? 'CoinCap' : 'CoinEx'),
        ),
      ),
      body: Column(
        children: [
          context.select((DevCoinBloc bloc) =>
              bloc.state.coinApi == CoinApi.coinCap
                  ? const _CoinCapButtons()
                  : const _CoinExButtons()),
          const _DataView(),
        ],
      ),
    );
  }
}

class _CoinCapButtons extends StatelessWidget {
  const _CoinCapButtons();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DevCoinBloc, DevCoinState, DevCoinEvent?>(
      selector: (state) {
        return state.lastEvent;
      },
      builder: (context, state) {
        return Wrap(
          children: [
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinCapAssetsList
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinCapAssetsList());
                    },
              child: const Text('AssetsList'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinCapAsset
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinCapAsset());
                    },
              child: const Text('Asset'),
            ),
          ],
        );
      },
    );
  }
}

class _CoinExButtons extends StatelessWidget {
  const _CoinExButtons();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DevCoinBloc, DevCoinState, DevCoinEvent?>(
      selector: (state) {
        return state.lastEvent;
      },
      builder: (context, state) {
        return Wrap(
          children: [
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinExAllMarketList
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinExAllMarketList());
                    },
              child: const Text('AllMarketList'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinExAllMarketInfo
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinExAllMarketInfo());
                    },
              child: const Text('AllMarketInfo'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinExSingleMarketInfo
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinExSingleMarketInfo());
                    },
              child: const Text('SingleMarketInfo'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinExMarketDepth
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinExMarketDepth());
                    },
              child: const Text('MarketDepth'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinExLatestTransactionData
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinExLatestTransactionData());
                    },
              child: const Text('LatestTransactionData'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinExKLineData
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinExKLineData());
                    },
              child: const Text('KLineData'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinExSingleMarketStatistics
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinExSingleMarketStatistics());
                    },
              child: const Text('SingleMarketStatistics'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinExAllMarketStatistics
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinExAllMarketStatistics());
                    },
              child: const Text('AllMarketStatistics'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinExCurrencyRate
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinExCurrencyRate());
                    },
              child: const Text('CurrencyRate'),
            ),
          ],
        );
      },
    );
  }
}

class _DataView extends StatelessWidget {
  const _DataView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<DevCoinBloc, DevCoinState>(
          builder: (BuildContext context, DevCoinState state) {
            switch (state.status) {
              case DevCoinStatus.initial:
                return const Center(
                  child: Text(
                    'Click a button',
                    style: TextStyle(color: Colors.green),
                  ),
                );
              case DevCoinStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case DevCoinStatus.failure:
                return Center(
                  child: Text(
                    'Failed to get data\n${state.error.toString()}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              case DevCoinStatus.success:
                return SingleChildScrollView(
                  child: Text(state.data.toString()),
                );
            }
          },
        ),
      ),
    );
  }
}

class _ChangeIcon extends StatefulWidget {
  const _ChangeIcon({required this.onPressed});

  final Function() onPressed;

  @override
  State<_ChangeIcon> createState() => _ChangeIconState();
}

class _ChangeIconState extends State<_ChangeIcon>
    with SingleTickerProviderStateMixin {
  double turn = 0.0;
  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turn,
      duration: const Duration(milliseconds: 500),
      child: IconButton(
        icon: const Icon(
          Icons.change_circle,
          size: 40,
        ),
        onPressed: () {
          setState(() {
            widget.onPressed();
            turn += 0.5;
          });
        },
      ),
    );
  }
}