import '../../typedefs.dart';

extension ConditionalAddOnList<E> on List<E> {
  void addIf(dynamic condition, E item) {
    if (condition is Condition) condition = condition();
    if (condition is bool && condition) add(item);
  }
}
