import 'package:bookingapp/core/network/dio_client.dart';
import 'package:bookingapp/core/network/network_info.dart';
import 'package:bookingapp/core/localstorage/app_local_storage.dart';
import 'package:bookingapp/core/localstorage/loacal_data_source.dart';
import 'package:bookingapp/feature/bottom_nav_bar/persentation/controller/bottom_nav_bar_cubit.dart';
import 'package:bookingapp/feature/events/data/datasource/events_datasource.dart';
import 'package:bookingapp/feature/events/data/repo/events_repo.dart';
import 'package:bookingapp/feature/events/domain/repo/events_repo.dart'
    show EventsRepo;

import 'package:bookingapp/feature/events/persentation/controller/events_cubit.dart';
import 'package:bookingapp/feature/organizer/data/data_source/organizer_data_source.dart';
import 'package:bookingapp/feature/organizer/data/repo/organizer_repo.dart';
import 'package:bookingapp/feature/organizer/domain/repo/organizer_repo.dart';
import 'package:bookingapp/feature/organizer/persenation/controller/organizer_cubit.dart';
import 'package:bookingapp/feature/register/data/datasource/register_datasource.dart';
import 'package:bookingapp/feature/register/data/repo/register_repo.dart';
import 'package:bookingapp/feature/register/domain/repo/register_repo.dart';
import 'package:bookingapp/feature/register/persentation/controller/register_cubit.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

Future initDI() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton(() => DioClient());
  getIt.registerFactory<NetworkInfo>(() => NetworkInfoImpl());

  getIt.registerLazySingleton<AppHiveLocalStorage>(() => AppHiveLocalStorage());
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<BottomNavBarCubit>(() => BottomNavBarCubit());

  getIt.registerLazySingleton<RegisterDatasource>(
    () => RegisterDatasourceImpl(dioClient: getIt()),
  );
  getIt.registerFactory<RegisterRepo>(
    () => RegisterRepoImpl(registerDatasource: getIt()),
  );
  getIt.registerLazySingleton<RegisterCubit>(
    () => RegisterCubit(registerRepo: getIt()),
  );
  getIt.registerLazySingleton<EventsDatasource>(
    () => EventsDatasourceImpl(dioClient: getIt()),
  );
  getIt.registerFactory<EventsRepo>(
    () => EventsRepoImpl(
      localDataSource: getIt(),
      networkInfo: getIt(),
      eventsDatasource: getIt(),
    ),
  );
  getIt.registerLazySingleton<EventsCubit>(
    () => EventsCubit(
      localDataSource: getIt(),
      eventsRepo: getIt(),
      networkInfo: getIt(),
    ),
  );

  getIt.registerLazySingleton<OrganizerDatasource>(
    () => OrganizerDatasourceImpl(dioClient: getIt()),
  );
  getIt.registerFactory<OrganizerRepo>(
    () => OrganizerRepoImpl(networkInfo: getIt(), oganizerDatasource: getIt()),
  );
  getIt.registerLazySingleton<OrganizerCubit>(
    () => OrganizerCubit(organizerRepo: getIt(), networkInfo: getIt()),
  );
}
