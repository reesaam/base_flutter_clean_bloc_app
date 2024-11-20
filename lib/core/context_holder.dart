import 'package:flutter/material.dart';

final Map<GlobalKey, Element> _contextKey = <GlobalKey, Element>{};

void _registerGlobalKey(GlobalKey key, Element element) {
  assert(() {
    if (_contextKey.containsKey(key)) {
      final Element oldElement = _contextKey[key]!;
      assert(element.widget.runtimeType != oldElement.widget.runtimeType);
    }
    return true;
  }());
  _contextKey[key] = element;
}

BuildContext _getContext() {
  _registerGlobalKey(_contextKey.keys.first, _contextKey.values.first);
  return _contextKey.values.first;
}

BuildContext get getContext => _getContext();
