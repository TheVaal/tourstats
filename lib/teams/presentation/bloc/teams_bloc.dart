import 'package:tourstats/core/domain/usecase/get_roster_usecase.dart';
import 'package:tourstats/core/domain/usecase/get_teams_usecase.dart';
import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/team.dart';
import 'package:tourstats/teams/domain/model/team_player.dart';
import 'package:tourstats/teams/presentation/team_ui.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'teams_event.dart';
part 'teams_state.dart';

class TeamsBloc
    extends Bloc<TeamsEvent, TeamsState> {

  final GetTeamsUseCase _getTeamsUseCase;
  final GetRosterUseCase _getRosterUseCase;
  
  TeamsBloc({
    required GetTeamsUseCase getTeamsUseCase,
    required GetRosterUseCase getRosterUseCase
  }) : _getTeamsUseCase = getTeamsUseCase,
    _getRosterUseCase = getRosterUseCase,
      super(TeamsState.initial()) {
    on<FetchTeamsData>(_onFetchData);
    on<FetchRosterData>(_onFetchRosterData);
  }

  Future<void> _onFetchData(
    FetchTeamsData event,
    Emitter<TeamsState> emit,
  ) {
    return emit.onEach(
      _getTeamsUseCase.fetchTeams(),
      onData: (result) async {
        switch (result) {
          
          case Ok<List<Team>>(): 
            
            return emit(TeamsState._(
              list:result.value.map(
                (value)=>TeamUi(
                  name: value.name,
                  logo: value.logo,
                  winCount: value.winCount,
                  lossCount: value.lossCount,
                  tag: value.tag,
                  id: value.id
                )
              ).toList()
            ));
           
          case Error<List<Team>>(): 
            return emit(
             TeamsState.error(state, result.error.toString())
            );
           
        }
      },
      onError: addError,
    );
  }
  
  Future<void> _onFetchRosterData(
    FetchRosterData event,
    Emitter<TeamsState> emit,
  ) {
    return emit.onEach(
      _getRosterUseCase.fetchRoster(event.teamId),
      onData: (result) async {
        switch (result) {
          
          case Ok<List<TeamPlayer>>(): 

            final updatedItems = state.list.map((item) {
              
              if (item.id == event.teamId) {
                
                return item.copyWith(
                  roster: result.value,
                  isOpen: true
                );
              } else {
                return item;
              }
            }).toList();
            
            return emit(TeamsState._(list: updatedItems));
           
          case Error<List<TeamPlayer>>(): 
            return emit(
             TeamsState.error(state, result.error.toString())
            );
           
        }
      }
    );
  }
}