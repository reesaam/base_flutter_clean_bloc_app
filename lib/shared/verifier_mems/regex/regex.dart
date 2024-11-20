import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'regex.mem.dart';
part 'regex.freezed.dart';
part 'regex.g.dart';

@Mem.all(withFreezed: true)
class AppRegex {
  final String? regexValue;
  final bool? isExceptionOfFormatting;
  const AppRegex({this.regexValue, this.isExceptionOfFormatting});
}

@Mem.all(withFreezed: true)
class AppRegexList {
  List<AppRegex>? regexesList;
  AppRegexList({this.regexesList});
}
