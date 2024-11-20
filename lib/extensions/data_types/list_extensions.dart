import '../../core/typedefs.dart';

extension ExtensionOnIterables on Iterable {
  T getMiddleElement<T>() => elementAt((length / 2).floor());
}

extension ExtensionOnLists on List {
  T getMiddleElement<T>() => elementAt((length / 2).floor());
}

extension ExtensionListAdd on List {
  void addIf(dynamic condition, dynamic item) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) add(item);
  }
}