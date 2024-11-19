

import '../../../core/core_elements/core_controller.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_resources/page_details.dart';

@DI.controller()
class AdminWidgetCheckController extends CoreController {

  @override
  AppPageDetail get pageDetail => AppPageDetails.adminWidgetCheckPage;

  functionCalledDialog() => AppAlertDialogs.withOk(text: 'Function Called', onTapOk: popPage);
}
