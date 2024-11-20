import 'package:dio/dio.dart';

import '../../core/annotations/dependency_injection_annotation.dart';
import '../../core/core_resources/texts.dart';
import '../di/di_setup.dart';

@DI.component
class DioCore {
  static DioCore get to => getIt<DioCore>();

  int get _defaultTimeOut => 15;

  Dio get dio => _getDio();

  _getDio() {
    var dio = Dio(BaseOptions());
    dio.options.headers.addAll({
      AppTexts.dioHeaderContentType: AppTexts.dioHeaderContentTypeData,
      AppTexts.dioHeaderConnection: AppTexts.dioHeaderConnectionData,
    });
    dio.options.connectTimeout = Duration(seconds: _defaultTimeOut);
    dio.options.receiveTimeout = Duration(seconds: _defaultTimeOut);
    dio.options.sendTimeout = Duration(seconds: _defaultTimeOut);
    return dio;
  }
}
