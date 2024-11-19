import 'di_setup.dart';

class DiCore<T> {
  const DiCore();

  T get() => getIt<T>();
}