import 'package:freezed_annotation/freezed_annotation.dart';

class FreezedCustom extends Freezed {
  static const model = Freezed(toJson: true, fromJson: true);
  static const modelResponse = Freezed(toJson: false, fromJson: true);
  static const modelRequest = Freezed(toJson: true, fromJson: false);
  static const modelList = Freezed(toJson: true, fromJson: true, makeCollectionsUnmodifiable: false);

  static const entity = Freezed(toJson: false, fromJson: false);
  static const entityList = Freezed(toJson: false, fromJson: false, makeCollectionsUnmodifiable: false);

  static const enums = JsonEnum(alwaysCreate: true);

  static const cubit = Freezed();
  static const state = Freezed();
}