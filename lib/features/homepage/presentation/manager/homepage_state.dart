part of 'homepage_cubit.dart';

@FreezedCustom.state
class HomepageState with _$HomepageState {
  const factory HomepageState.initial() = _Initial;
  const factory HomepageState.loading() = _Loading;
  const factory HomepageState.failure() = _Failure;
}
