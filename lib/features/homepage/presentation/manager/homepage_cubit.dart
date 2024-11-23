import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/annotations/dependency_injection_annotation.dart';
import '../../../../core/annotations/freezed_custom_annotation.dart';
import '../../../../core/bloc_core_functions.dart';
import '../../../../core/core_elements/core_cubit.dart';
import '../../../../core/core_resources/page_details.dart';
import '../../../../shared/shared_mems/core_mems/app_page_detail_mem/app_page_detail.dart';

part 'homepage_state.dart';
part 'homepage_cubit.freezed.dart';

@DI.controller
class HomepageCubit extends CoreCubit<HomepageState> {
  HomepageCubit() : super(const HomepageState.initial());

  @override
  AppPageDetailEntity get pageDetail => AppPageDetailsList.to.homepage;

  @override
  List<BlocProvider> get cubits => [
    provideBlocProvider<HomepageCubit>(),
  ];
}
