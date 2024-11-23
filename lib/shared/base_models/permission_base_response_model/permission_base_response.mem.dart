// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_base_response.dart';

// **************************************************************************
// Generator: AnnotationBuilder
// **************************************************************************

///   This File is Generated by Dart Mem Annotation Generator
///   [PermissionBaseResponse] Annotated with [Mem] with [all] mode
///   Including:
///     Model Class, Entity Class and Mapper Class,
///     Model Classes includes [toJson] and [fromJson] functions, and Entity Classes are not!
///     Mappers will convert every filed in the class including [SubClasses], they should be annotated as well.
///     [Mem] Annotation will generate all these fields for all Classes, so all subclasses should decorated with annotation to generate model, entity and mapper to use them here
///     [Enums] also supported and they will be detected and count into account for mappers and also json conversion
///     Classes are decorated with [Freezed], other functions will generate with [Freezed]

///   Details:
///     Class: PermissionBaseResponse
///     Constructors Count: 1
///     Variables Count: 2

///   ==> Model Class:
@Freezed(toJson: true, fromJson: true)
class PermissionBaseResponseModel with _$PermissionBaseResponseModel {
  const factory PermissionBaseResponseModel({
    @JsonEnum() final PermissionStatus? status,
    final String? permission,
  }) = _PermissionBaseResponseModel;

  factory PermissionBaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionBaseResponseModelFromJson(json);
}

///   ==> Entity Class:
@Freezed(toJson: false, fromJson: false)
class PermissionBaseResponseEntity with _$PermissionBaseResponseEntity {
  const factory PermissionBaseResponseEntity({
    @JsonEnum() final PermissionStatus? status,
    final String? permission,
  }) = _PermissionBaseResponseEntity;
}

///   ==> Mapper Classes:
///   ==> Entity to Model Mapper Extension
extension MapperExtensionOnPermissionBaseResponseEntity
    on PermissionBaseResponseEntity {
  PermissionBaseResponseModel get mapper => PermissionBaseResponseModel(
        status: status,
        permission: permission,
      );
}

///   ==> Model to Entity Mapper Extension
extension MapperExtensionOnPermissionBaseResponseModel
    on PermissionBaseResponseModel {
  PermissionBaseResponseEntity get mapper => PermissionBaseResponseEntity(
        status: status,
        permission: permission,
      );
}
