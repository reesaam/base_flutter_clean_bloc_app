import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notification_base.mem.dart';
part 'push_notification_base.freezed.dart';
part 'push_notification_base.g.dart';

@Mem.all(withFreezed: true)
class AppPushNotificationBase {
  String? title;
}
