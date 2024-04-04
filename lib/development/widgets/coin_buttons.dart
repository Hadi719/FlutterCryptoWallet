import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dev_coin_bloc/dev_coin_bloc.dart';

class CoinCapButtons extends StatelessWidget {
  const CoinCapButtons({super.key});

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
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinCapAssetHistories
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinCapAssetHistories());
                    },
              child: const Text('AssetHistories'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinCapAssetMarkets
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinCapAssetMarkets());
                    },
              child: const Text('AssetMarkets'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinCapRatesList
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinCapRatesList());
                    },
              child: const Text('RatesList'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinCapRate
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinCapRate());
                    },
              child: const Text('Rate'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinCapExchangesList
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinCapExchangesList());
                    },
              child: const Text('ExchangesList'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinCapExchange
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinCapExchange());
                    },
              child: const Text('Exchange'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinCapMarketsList
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinCapMarketsList());
                    },
              child: const Text('MarketsList'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinCapCandlesList
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinCapCandlesList());
                    },
              child: const Text('CandlesList'),
            ),
          ],
        );
      },
    );
  }
}

class CoinExButtons extends StatelessWidget {
  const CoinExButtons({super.key});

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

class CoinGeckoButtons extends StatelessWidget {
  const CoinGeckoButtons({super.key});

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
              onPressed: state.runtimeType == DevCoinGeckoSimplePricesList
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinGeckoSimplePricesList());
                    },
              child: const Text('SimplePricesList'),
            ),
            ElevatedButton(
              onPressed:
                  state.runtimeType == DevCoinGeckoSimpleSupportedVsCurrencies
                      ? null
                      : () {
                          context
                              .read<DevCoinBloc>()
                              .add(DevCoinGeckoSimpleSupportedVsCurrencies());
                        },
              child: const Text('SimpleSupportedVsCurrencies'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinGeckoCoinMetadata
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinGeckoCoinMetadata());
                    },
              child: const Text('CoinMetadata'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinGeckoCoinHistory
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinGeckoCoinHistory());
                    },
              child: const Text('CoinHistory'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinGeckoCoinsMarketsList
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinGeckoCoinsMarketsList());
                    },
              child: const Text('CoinsMarketsList'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinGeckoCoinMarketChart
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinGeckoCoinMarketChart());
                    },
              child: const Text('CoinMarketChart'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinGeckoCoinMarketChartRange
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinGeckoCoinMarketChartRange());
                    },
              child: const Text('CoinMarketChartRange'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinGeckoCoinOHLC
                  ? null
                  : () {
                      context.read<DevCoinBloc>().add(DevCoinGeckoCoinOHLC());
                    },
              child: const Text('CoinOHLC'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinGeckoAssetPlatformsList
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinGeckoAssetPlatformsList());
                    },
              child: const Text('AssetPlatformsList'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinGeckoExchangeRates
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinGeckoExchangeRates());
                    },
              child: const Text('ExchangeRates'),
            ),
          ],
        );
      },
    );
  }
}

class FirebaseStorageButtons extends StatelessWidget {
  const FirebaseStorageButtons({super.key});

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
              onPressed:
                  state.runtimeType == DevCoinGeckoFsUploadCoinsMarketsList
                      ? null
                      : () {
                          context
                              .read<DevCoinBloc>()
                              .add(DevCoinGeckoFsUploadCoinsMarketsList());
                        },
              child: const Text('UploadCoinsMarketsList'),
            ),
            ElevatedButton(
              onPressed:
                  state.runtimeType == DevCoinGeckoFsDownloadCoinsMarketsList
                      ? null
                      : () {
                          context
                              .read<DevCoinBloc>()
                              .add(DevCoinGeckoFsDownloadCoinsMarketsList());
                        },
              child: const Text('DownloadCoinsMarketsList'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinGeckoFsUploadCoinHistory
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinGeckoFsUploadCoinHistory());
                    },
              child: const Text('UploadCoinHistory'),
            ),
            ElevatedButton(
              onPressed: state.runtimeType == DevCoinGeckoFsDownloadCoinHistory
                  ? null
                  : () {
                      context
                          .read<DevCoinBloc>()
                          .add(DevCoinGeckoFsDownloadCoinHistory());
                    },
              child: const Text('DownloadCoinHistory'),
            ),
          ],
        );
      },
    );
  }
}
