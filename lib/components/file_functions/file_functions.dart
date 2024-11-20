import 'dart:io';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';

import '../../../core/core_functions.dart';
import '../../core/annotations/dependency_injection_annotation.dart';
import '../di/di_setup.dart';

@DI.component
class AppFileFunctions {
  static AppFileFunctions get to => getIt<AppFileFunctions>();

  Future<String?> saveFile({
    required String fileName,
    required data,
    String? filePath,
  }) async {
    SaveFileDialogParams saveParams = SaveFileDialogParams(data: data, fileName: fileName, sourceFilePath: filePath);
    String? path = await FlutterFileDialog.saveFile(params: saveParams);
    appLogPrint('File Saved');
    appDebugPrint('Filename: ${saveParams.fileName}');
    appDebugPrint('Path: ${saveParams.sourceFilePath}');
    appLogPrint('File Path: $path');
    return path;
  }

  Future<File?> pickFile({
    OpenFileDialogType? dialogType,
    SourceType? sourceType,
    List<String>? fileExtensionsFilter,
  }) async {
    File? importFile;
    OpenFileDialogParams openFileParams = OpenFileDialogParams(
      dialogType: dialogType ?? OpenFileDialogType.document,
      fileExtensionsFilter: fileExtensionsFilter,
    );
    String? importFilePath = await FlutterFileDialog.pickFile(params: openFileParams);
    if (importFilePath != null) {
      importFile = File(importFilePath);
    }
    // String stringData = String.fromCharCodes(importFile.readAsBytesSync());
    // var jsonData = json.decode(stringData);
    return importFile;
  }
}