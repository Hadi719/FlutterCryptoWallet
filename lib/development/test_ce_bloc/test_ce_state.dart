part of 'test_ce_bloc.dart';

enum TestCeStatus { initial, success, loading, failure }

final class TestCeState extends Equatable {
  const TestCeState({
    this.status = TestCeStatus.initial,
    this.lastEvent,
    this.data = const [],
  });

  final TestCeStatus status;
  final TestCeEvent? lastEvent;
  final dynamic data;

  TestCeState copyWith({
    TestCeStatus? status,
    TestCeEvent? lastEvent,
    dynamic data,
  }) {
    return TestCeState(
      status: status ?? this.status,
      lastEvent: lastEvent ?? this.lastEvent,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, lastEvent, data];

  @override
  String toString() {
    return '''TestCeState { status: $status, lastEvent: $lastEvent data: ${data.toString()} }''';
  }
}
