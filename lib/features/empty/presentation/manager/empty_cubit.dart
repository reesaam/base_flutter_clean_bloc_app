import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/annotations/freezed_custom_annotation.dart';

part 'empty_state.dart';
part 'empty_cubit.freezed.dart';

class EmptyCubit extends Cubit<EmptyState> {
  EmptyCubit() : super(const EmptyState.initial());
}
