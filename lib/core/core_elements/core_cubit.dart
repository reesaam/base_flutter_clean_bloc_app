import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared_mems/core_mems/app_page_detail_mem/app_page_detail.dart';

abstract class CoreCubit<State extends Object> extends Cubit<State> {
  CoreCubit(super.initialState);

  AppPageDetailEntity get pageDetail;
  List<BlocProvider> get cubits;
}