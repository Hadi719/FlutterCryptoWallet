import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dev_coin_bloc/dev_coin_bloc.dart';
import 'widgets/widgets.dart';

class DevCoinApi extends StatelessWidget {
  const DevCoinApi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<DevCoinBloc>(
        create: (_) => DevCoinBloc(),
        child: const LayoutBuilder(),
      ),
    );
  }
}

class LayoutBuilder extends StatelessWidget {
  const LayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ChangeIcon(
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
                return const FirebaseStorageButtons();
              case CoinApi.coinGecko:
                return const CoinGeckoButtons();
              case CoinApi.coinCap:
                return const CoinCapButtons();
              case CoinApi.coinEx:
              default:
                return const CoinExButtons();
            }
          }),
          const DataView(),
        ],
      ),
    );
  }
}
