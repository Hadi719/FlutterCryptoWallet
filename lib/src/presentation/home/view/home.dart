import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/coinex/responses/single_market_statistics_response.dart';
import '../cubit/home_cubit.dart';

const double kImageSize = 50;
const double kItemSize = 50;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String screenName = 'HomePage';

  static Page<void> page() => const MaterialPage<void>(
        child: HomePage(),
        name: screenName,
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.initial:
              context.read<HomeCubit>().getAllMarketStatistics();
              return const _LoadingWidget(
                key: ObjectKey('__Home_Initial_loading_widget'),
              );
            case HomeStatus.loading:
              return const _LoadingWidget(
                key: ObjectKey('_Home_Loading_widget'),
              );
            case HomeStatus.failure:
              return _ErrorWidget(
                key: const ObjectKey('_Home_Error_widget'),
                error: state.error.toString(),
              );
            case HomeStatus.success:
            default:
              return const _ListWidget(
                key: ObjectKey('_Home_List_widget'),
              );
          }
        },
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    super.key,
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}

class _ListWidget extends StatelessWidget {
  const _ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedList(
        padding: const EdgeInsets.all(8),
        initialItemCount: 9,
        shrinkWrap: true,
        itemBuilder: (ctx, index, animation) {
          return BlocSelector<HomeCubit, HomeState,
              SingleMarketStatisticsResponse>(
            selector: (state) {
              return state.allMarketStatisticsResponse!.data[index];
            },
            builder: (context, state) {
              return SizedBox(
                height: 120,
                child: Card(
                  margin: const EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage(state.cryptoDetail.iconPath),
                        height: kImageSize,
                        width: kImageSize,
                      ),
                      Wrap(
                        spacing: 4,
                        runSpacing: 10,
                        // crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        // runAlignment: WrapAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          const SizedBox(width: kImageSize),
                          Text(
                            'latestTransactionPrice\n${state.latestTransactionPrice}',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'openingPrice24H\n${state.openingPrice24H}',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'highestPrice24H\n${state.highestPrice24H}',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'lowestPrice24H\n${state.lowestPrice24H}',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'volume24H\n${state.volume24H}',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/*

class  extends StatefulWidget {
  const ({super.key});

  @override
  State<> createState() => _State();
}

class _State extends State<> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
*/
