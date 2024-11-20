import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/annotations.dart';

import '../../../../components/di/di_setup.dart';
import '../../../../core/core_elements/core_view.dart';
import '../manager/homepage_cubit.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<HomepageCubit>(
      create: (context) => getIt<HomepageCubit>(),
      child: BlocConsumer<HomepageCubit, HomepageState>(
        listener: (context, state) => state.whenOrNull(),
        builder: (context, state) =>
            state.whenOrNull(
              initial: () => _HomePage(),
            ) ??
            const SizedBox.shrink(),
      ));
}

class _HomePage extends CoreView {
  @override
  Widget get body => Center(
          child: Column(
        children: List.generate(
          30,
          (index) => Text('HomePage Page', style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
      ));
}
