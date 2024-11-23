import '../../shared/helper_mems/custom_duration_mem/custom_duration.dart';
import 'duration_extensions.dart';

extension ExtensionCustomDuration on CustomDurationEntity {
  Duration toDuration() => Duration(days: day ?? 0, hours: hour ?? 0, minutes: minute ?? 0, seconds: second ?? 0, milliseconds: milliSecond ?? 0);

  String toFormattedOffset() => toDuration().toTimeZoneFormat();
}
