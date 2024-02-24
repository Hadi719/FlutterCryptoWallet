import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import '../../../config/utils/resources/data_state.dart';
import '../../../domain/models/coingecko/request/request.dart';
import '../../../domain/models/coingecko/response/response.dart';
import '../../../domain/models/firestore/firestore.dart';
import '../../../domain/repositories/coingecko_api_repository.dart';
import '../../../service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CoinGeckoApiRepository _geckoRepo =
      serviceLocator<CoinGeckoApiRepository>();
  final FirebaseFirestore _firestore = serviceLocator<FirebaseFirestore>();

  HomeCubit() : super(const HomeState());

  Future<void> getMarketsList() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final DataState<CoinsMarketsListResponse> response =
        await _geckoRepo.getCoinsMarketsList(
      /// Todo: add Currencies, Order,
      request: CoinsMarketsListRequest(
        vsCurrency: 'usd',
        perPage: 10,
        page: 1,
      ),
    );
    if (response is DataSuccess) {
      emit(state.copyWith(
        status: HomeStatus.success,
        coins: response.data?.data,
      ));
    } else {
      emit(state.copyWith(
        status: HomeStatus.failure,
        error: response.error,
      ));
    }
  }

  Future<void> getMarketsListJsonFile() async {
    emit(state.copyWith(status: HomeStatus.loading));
    var jsonFile = await rootBundle
        .loadString(
            'lib/development/coins_response_examples/gecko/coins_markets_list.json')
        .catchError((err) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        error: err,
      ));
      return err;
    });
    CoinsMarketsListResponse data = CoinsMarketsListResponse.fromJson(
      jsonDecode(jsonFile),
    );
    await putInFirestore(data);
    emit(state.copyWith(
      status: HomeStatus.success,
      coins: data.data,
    ));
  }

  Future<void> putInFirestore(CoinsMarketsListResponse data) async {
    await const FirestoreGeckoCoinsMarketsList()
        .ref(_firestore)
        .set(data.toFirestore());
  }

  Future<void> getFromFirestore() async {
    emit(state.copyWith(status: HomeStatus.loading));
    await const FirestoreGeckoCoinsMarketsList().ref(_firestore).get().then(
      (value) {
        final resp = CoinsMarketsListResponse.fromJson(value.data() ?? {});
        emit(state.copyWith(
          status: HomeStatus.success,
          coins: resp.data,
        ));
      },
    );
  }
}
