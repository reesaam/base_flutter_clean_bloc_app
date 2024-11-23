import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_page_detail.mem.dart';
part 'app_page_detail.freezed.dart';
part 'app_page_detail.g.dart';

@Mem.all(withFreezed: true)
class AppPageDetail {
  String? pageRoute;
  String? pageName;
  int? bottomBarItemNumber;
  bool? drawerPresence;
  int? iconCode;
}

@Mem.all(withFreezed: true)
class AppPageDetailList {
  List<AppPageDetail>? pageDetailList;
}