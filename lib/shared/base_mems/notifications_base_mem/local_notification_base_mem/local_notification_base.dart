import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_notification_base.mem.dart';
part 'local_notification_base.freezed.dart';
part 'local_notification_base.g.dart';

@Mem.all(withFreezed: true)
class AppLocalNotificationBase {
  String? title;
}
