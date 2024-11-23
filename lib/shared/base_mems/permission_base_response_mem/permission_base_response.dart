import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_base_response.mem.dart';
part 'permission_base_response.freezed.dart';
part 'permission_base_response.g.dart';

@Mem.all(withFreezed: true)
class PermissionBaseResponse {
  PermissionStatus? status;
  String? permission;
}
