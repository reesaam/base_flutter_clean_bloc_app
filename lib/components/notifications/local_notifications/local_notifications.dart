import 'package:awesome_notifications/awesome_notifications.dart';

import '../../../core/annotations/dependency_injection_annotation.dart';
import '../../di/di_setup.dart';
import '../notifications_enums.dart';
import '../notifications_repository.dart';
import 'local_notifications_repository.dart';

@DI.component
class AppLocalNotifications extends AppNotificationsRepository {
  static AppLocalNotifications get to => getIt<AppLocalNotifications>();

  @override
  Future<bool> init() async => await AppLocalNotificationsRepository().init();

  @override
  Future<bool> simple({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
  }) async {
    var result = await AppLocalNotificationsRepository().createNotification(
      channelKey: AppNotificationChannelKey.simple,
      title: title,
      bigPicture: bigPicture,
      body: body,
      icon: icon,
      largeIcon: largeIcon,
      timeoutAfterLongSeconds: timeoutAfterLongSeconds,
      wakeUpScreen: wakeUpScreen,
    );
    return result;
  }

  @override
  Future<bool> scheduled({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
    required DateTime dateTime,
  }) async {
    var result = await AppLocalNotificationsRepository().createNotification(
      channelKey: AppNotificationChannelKey.simple,
      title: title,
      bigPicture: bigPicture,
      body: body,
      icon: icon,
      largeIcon: largeIcon,
      timeoutAfterLongSeconds: timeoutAfterLongSeconds,
      wakeUpScreen: wakeUpScreen,
      calendar: NotificationCalendar.fromDate(date: dateTime),
    );
    return result;
  }

  @override
  Future<bool> intervalBased({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
    required int interval,
    bool? repeat,
    bool? preciseAlarm,
  }) async {
    var result = await AppLocalNotificationsRepository().createNotification(
      channelKey: AppNotificationChannelKey.simple,
      title: title,
      bigPicture: bigPicture,
      body: body,
      icon: icon,
      largeIcon: largeIcon,
      timeoutAfterLongSeconds: timeoutAfterLongSeconds,
      wakeUpScreen: wakeUpScreen,
      interval: NotificationInterval(
        interval: interval,
        repeats: repeat ?? false,
        preciseAlarm: preciseAlarm ?? true,
      ),
    );
    return result;
  }
}
