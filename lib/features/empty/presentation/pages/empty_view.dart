import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/di/di_setup.dart';
import '../manager/empty_cubit.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<EmptyCubit>(
      create: (context) => getIt<EmptyCubit>(),
      child: Builder(
          builder: (context) => BlocConsumer<EmptyCubit, EmptyState>(
                listener: (context, state) => state,
                builder: (context, state) => const Center(child: Text('Empty Page')),
              )));
}
