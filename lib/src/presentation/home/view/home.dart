import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/coingecko/response/coins/coins_markets_list_response.dart';
import '../../widgets/widgets.dart' show MyLoading, MyError;
import '../cubit/home_cubit.dart';
import '../widgets/coin_data.dart';
import '../widgets/coin_image.dart';

const double kImageSize = 50;
const double kItemSize = 50;

class HomePage extends StatelessWidget {
  static const String screenName = 'HomePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const _HomeView(),
    );
  }

  static Page<void> page() => const MaterialPage<void>(
        child: HomePage(),
        name: screenName,
      );
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.initial:
              context.read<HomeCubit>().getCoinsDataFromJson();
              return const MyLoading(
                key: ObjectKey('__Home_Initial_loading_widget'),
              );
            case HomeStatus.failure:
              return MyError(
                key: const ObjectKey('_Home_Error_widget'),
                error: state.error.toString(),
              );
            case HomeStatus.success:
              return const _CoinsList(
                key: ObjectKey('_Home_List_widget'),
              );
            case HomeStatus.loading:
            default:
              return const MyLoading(
                key: ObjectKey('_Home_Loading_widget'),
              );
          }
        },
      ),
    );
  }
}

class _CoinsList extends StatelessWidget {
  const _CoinsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedList(
        padding: const EdgeInsets.all(8),
        initialItemCount:
            context.select((HomeCubit cubit) => cubit.state.coins?.length ?? 0),
        shrinkWrap: true,
        itemBuilder: (ctx, index, animation) {
          return BlocSelector<HomeCubit, HomeState, CoinMarketData?>(
            selector: (state) {
              return state.coins?[index];
            },
            builder: (context, state) {
              return Card(
                margin: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    CoinImage(
                      imageUrl: state?.image,
                      height: kImageSize,
                      width: kImageSize,
                    ),
                    CoinData(coin: state, imageSize: kImageSize),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
