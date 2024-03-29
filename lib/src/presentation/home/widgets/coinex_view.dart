const double kImageSize = 50;
const double kItemSize = 50;
/*
class HomePageCoinEX extends StatelessWidget {
  static const String screenName = 'HomePageCoinEX';

  const HomePageCoinEX({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }

  static Page<void> page() => const MaterialPage<void>(
        child: HomePageCoinEX(),
        name: screenName,
      );
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

class _ErrorWidget extends StatelessWidget {
  final String error;

  const _ErrorWidget({
    super.key,
    required this.error,
  });

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

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
*/
