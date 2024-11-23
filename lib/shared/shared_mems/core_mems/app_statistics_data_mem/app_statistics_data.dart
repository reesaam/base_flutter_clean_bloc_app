import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_statistics_data.mem.dart';
part 'app_statistics_data.freezed.dart';
part 'app_statistics_data.g.dart';

@Mem.all(withFreezed: true)
class AppStatisticsData {
  int? launches;
  int? logins;
  int? crashes;
  int? pageOpens;
  int? apiCalls;
  DateTime? installDateTime;
  Duration? installDuration;
}