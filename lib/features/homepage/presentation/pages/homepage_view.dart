import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/annotations.dart';

import '../../../../core/core_elements/core_view.dart';
import '../manager/homepage_cubit.dart';

@RoutePage()
class HomePage extends CoreView<HomepageCubit> {
  const HomePage({super.key});

  @override
  Widget get body => BlocBuilder<HomepageCubit, HomepageState>(
    builder: (context, state) =>
    state.whenOrNull(
      initial: () => Center(child: Text('controller.pageDetail.pageName' ?? '-')),
    ) ??
        const SizedBox.shrink(),
  );
}
