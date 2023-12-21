part of 'test_ce_bloc.dart';

sealed class TestCeEvent extends Equatable {
  const TestCeEvent();

  @override
  List<Object> get props => [];
}

final class TestCeAllMarketList extends TestCeEvent {}

final class TestCeAllMarketInfo extends TestCeEvent {}

final class TestCeSingleMarketInfo extends TestCeEvent {}

final class TestCeMarketDepth extends TestCeEvent {}

final class TestCeLatestTransactionData extends TestCeEvent {}

final class TestCeKLineData extends TestCeEvent {}

final class TestCeSingleMarketStatistics extends TestCeEvent {}

final class TestCeAllMarketStatistics extends TestCeEvent {}

final class TestCeCurrencyRate extends TestCeEvent {}
