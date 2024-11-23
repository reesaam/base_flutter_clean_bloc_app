import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/di/di_setup.dart';

BlocProvider<C> provideBlocProvider<C extends Cubit>() => BlocProvider<C>(create: (context) => getIt<C>());
