import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notification_base_model.mem.dart';
part 'push_notification_base_model.freezed.dart';
part 'push_notification_base_model.g.dart';

@Mem.all(withFreezed: true)
class AppPushNotificationBase {
  String? title;
}
