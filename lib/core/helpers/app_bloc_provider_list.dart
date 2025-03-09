import 'package:bookingapp/core/helpers/dependency_injection.dart';
import 'package:bookingapp/feature/bottom_nav_bar/persentation/controller/bottom_nav_bar_cubit.dart';
import 'package:bookingapp/feature/events/persentation/controller/events_cubit.dart';
import 'package:bookingapp/feature/organizer/persenation/controller/organizer_cubit.dart';
import 'package:bookingapp/feature/register/persentation/controller/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> appBlocProviders() {
  return [
    BlocProvider<BottomNavBarCubit>(
      create: (context) => getIt<BottomNavBarCubit>(),
    ),
    BlocProvider<EventsCubit>(create: (context) => getIt<EventsCubit>()),
    BlocProvider<OrganizerCubit>(create: (context) => getIt<OrganizerCubit>()),
    BlocProvider<RegisterCubit>(create: (context) => getIt<RegisterCubit>()),
  ];
}
