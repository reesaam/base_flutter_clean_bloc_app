import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_duration.mem.dart';
part 'custom_duration.freezed.dart';
part 'custom_duration.g.dart';

@Mem.all(withFreezed: true)
class CustomDuration {
  int? year;
  int? month;
  int? week;
  int? day;
  int? hour;
  int? minute;
  int? second;
  int? milliSecond;
}