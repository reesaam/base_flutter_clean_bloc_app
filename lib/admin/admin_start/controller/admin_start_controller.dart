

import '../../../core/core_elements/core_controller.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../core/core_resources/page_details.dart';

@DI.controller()
class AdminStartController extends CoreController {
  List<AppPageDetail> pages = List<AppPageDetail>.empty(growable: true);

  @override
  AppPageDetail get pageDetail => AppPageDetails.adminStartPage;

  @override
  void dataInit() {
    pages = AppPageDetails.listAdminPages;
  }
}
