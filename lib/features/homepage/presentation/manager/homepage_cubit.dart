import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/annotations/dependency_injection_annotation.dart';
import '../../../../core/annotations/freezed_custom_annotation.dart';

part 'homepage_state.dart';
part 'homepage_cubit.freezed.dart';

@DI.controller
class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit() : super(const HomepageState.initial());
}
