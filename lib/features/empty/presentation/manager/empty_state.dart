part of 'empty_cubit.dart';

@FreezedCustom.state
class EmptyState with _$EmptyState {
  const factory EmptyState.initial() = _Initial;
  const factory EmptyState.loading() = _Loading;
  const factory EmptyState.failure() = _Failure;
}
