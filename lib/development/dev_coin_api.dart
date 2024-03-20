import 'package:firebase_storage/firebase_storage.dart';
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
          context.select((DevCoinBloc bloc) => bloc.state.coinApi.name),
        ),
      ),
      body: Column(
        children: [
          context.select((DevCoinBloc bloc) {
            switch (bloc.state.coinApi) {
              case CoinApi.firebaseStorage:
                return const _FirebaseStorageButtons();
              case CoinApi.coinGecko:
                return const _CoinGeckoButtons();
              case CoinApi.coinCap:
                return const _CoinCapButtons();
              case CoinApi.coinEx:
              default:
                return const _CoinExButtons();
            }
          }),
          const _DataView(),
        ],
      ),
    );
  }
}

class _ChangeIcon extends StatefulWidget {
  final Function() onPressed;

  const _ChangeIcon({required this.onPressed});

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

class _CoinGeckoButtons extends StatelessWidget {
  const _CoinGeckoButtons();

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

class _FirebaseStorageButtons extends StatelessWidget {
  const _FirebaseStorageButtons();

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
                  child: SelectableText(
                    'Failed to get data\n${state.error.toString()}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              case DevCoinStatus.success:
                if (state.data.runtimeType == UploadTask) {
                  return const _UploadTaskListTile();
                }
                return Scrollbar(
                  interactive: true,
                  child: SingleChildScrollView(
                    child: SelectableText(state.data.toString()),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class _UploadTaskListTile extends StatelessWidget {
  const _UploadTaskListTile({super.key});

  /// Displays the current transferred bytes of the task.
  String _bytesTransferred(TaskSnapshot snapshot) {
    return '${snapshot.bytesTransferred}/${snapshot.totalBytes}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DevCoinBloc, DevCoinState, UploadTask>(
      selector: (state) => state.data,
      builder: (context, task) {
        return StreamBuilder<TaskSnapshot>(
          stream: task.snapshotEvents,
          builder: (
            BuildContext context,
            AsyncSnapshot<TaskSnapshot> asyncSnapshot,
          ) {
            TaskSnapshot? snapshot = asyncSnapshot.data;
            TaskState? taskState = snapshot?.state;

            if (asyncSnapshot.hasError) {
              if (asyncSnapshot.error is FirebaseException &&
                  // ignore: cast_nullable_to_non_nullable
                  (asyncSnapshot.error as FirebaseException).code ==
                      'canceled') {
                context.read<DevCoinBloc>().add(const DevCoinChangeSubtitle(
                      subtitle: 'Upload canceled.',
                    ));
              } else {
                // ignore: avoid_print
                print(asyncSnapshot.error);
                context.read<DevCoinBloc>().add(const DevCoinChangeSubtitle(
                      subtitle: 'Something went wrong.',
                    ));
              }
            } else if (snapshot != null) {
              context.read<DevCoinBloc>().add(DevCoinChangeSubtitle(
                    subtitle:
                        '$taskState: ${_bytesTransferred(snapshot)} bytes sent',
                  ));
            }

            return Dismissible(
              key: Key(task.hashCode.toString()),
              onDismissed: ($) => task.cancel(),
              child: ListTile(
                title: Text('Upload Task #${task.hashCode}'),
                subtitle: SelectableText(
                  context.select((DevCoinBloc bloc) => bloc.state.subtitle),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (taskState == TaskState.running)
                      IconButton(
                        icon: const Icon(Icons.pause),
                        onPressed: task.pause,
                      ),
                    if (taskState == TaskState.running)
                      IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: task.cancel,
                      ),
                    if (taskState == TaskState.paused)
                      IconButton(
                        icon: const Icon(Icons.file_upload),
                        onPressed: task.resume,
                      ),
                    if (taskState == TaskState.success)
                      IconButton(
                        icon: const Icon(Icons.file_download),
                        onPressed: () {
                          context.read<DevCoinBloc>().add(
                                DevCoinGeckoFsDownloadCoinHistory(),
                              );
                        },
                      ),
                    if (taskState == TaskState.success)
                      IconButton(
                        icon: const Icon(Icons.link),
                        onPressed: () async {
                          final downloadLink =
                              await snapshot?.ref.getDownloadURL();
                          context.read<DevCoinBloc>().add(
                                DevCoinChangeSubtitle(
                                  subtitle: downloadLink ?? 'Oops 1',
                                ),
                              );
                        },
                      ),
                    if (taskState == TaskState.success)
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => snapshot?.ref.delete(),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
