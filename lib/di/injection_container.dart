import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:tourstats/core/data/constants/remote_constants.dart';
import 'package:tourstats/core/data/datasource/opendota_datasource.dart';
import 'package:tourstats/core/data/datasource/stratz_datasource.dart';
import 'package:tourstats/core/domain/usecase/get_leagues_usecase.dart';
import 'package:tourstats/core/domain/usecase/get_roster_usecase.dart';
import 'package:tourstats/core/domain/usecase/get_teams_usecase.dart';
import 'package:tourstats/leagues/data/repository/stratz_leagues_repository.dart';
import 'package:tourstats/leagues/domain/repository/remote_leagues_repository.dart';
import 'package:tourstats/leagues/domain/usecase/get_leagues_usecase_impl.dart';
import 'package:tourstats/leagues/presentation/components/bloc/leagues_bloc.dart';
import 'package:tourstats/teams/data/repository/opendota_roster_repository.dart';
import 'package:tourstats/teams/data/repository/stratz_teams_repository.dart';
import 'package:tourstats/teams/domain/repository/remote_roster_repository.dart';
import 'package:tourstats/teams/domain/repository/remote_teams_repository.dart';
import 'package:tourstats/teams/domain/usecase/get_roster_usecase_impl.dart';
import 'package:tourstats/teams/domain/usecase/get_teams_usecase_impl.dart';
import 'package:tourstats/teams/presentation/bloc/teams_bloc.dart';

final locator = GetIt.instance;
Future<void> init() async {
  locator.registerSingleton(
    GraphQLClient(
      link: RemoteConstants.apiLink, 
      cache: GraphQLCache(),
      queryRequestTimeout: Duration(seconds: 60)
    )
  );
  locator.registerLazySingleton<StratzDatasource>(
    () => StratzDatasourceImpl(client: locator()),
  );
  locator.registerLazySingleton<RemoteTeamsRepository>(
    () => StratzTeamsRepository(datasource: locator()),
  );
  locator.registerLazySingleton<RemoteLeaguesRepository>(
    () => StratzLeaguesRepository(datasource: locator()),
  );
  locator.registerLazySingleton<GetLeaguesUseCase>(
    () => GetLeaguesUseCaseImpl(repository: locator()),
  );

  locator.registerLazySingleton<GetTeamsUseCase>(
    () => GetTeamsUseCaseImpl(repository: locator()),
  );

  locator.registerLazySingleton<OpendotaDataSource>(
    () => OpendotaDataSourceImpl(),
  );
  locator.registerLazySingleton<RemoteRosterRepository>(
    () => OpendotaRosterRepository(datasource: locator()),
  );
  locator.registerLazySingleton<GetRosterUseCase>(
    () => GetRosterUseCaseImpl(repository: locator()),
  );

  locator.registerFactory(() => TeamsBloc(
      getTeamsUseCase: locator(),
      getRosterUseCase: locator()
    )
  );
    locator.registerFactory(() => LeaguesBloc(
      getLeaguesUseCase: locator(),
    )
  );
}