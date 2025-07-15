import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:tourstats/core/domain/usecase/get_leagues_usecase.dart';
import 'package:tourstats/core/domain/utils/result.dart';
import 'package:tourstats/teams/domain/model/league.dart';

part 'leagues_event.dart';
part 'leagues_state.dart';


class LeaguesBloc
    extends Bloc<LeaguesEvent, LeaguesState> {

  final GetLeaguesUseCase _getLeaguesUseCase;

  
  LeaguesBloc({
    required GetLeaguesUseCase getLeaguesUseCase,

  }) : _getLeaguesUseCase = getLeaguesUseCase,
      super(LeaguesState.initial()) {
    on<FetchLeaguesData>(_onFetchData);

  }
  
  
  Future<void> _onFetchData(
    FetchLeaguesData event,
    Emitter<LeaguesState> emit,
  ) {
    return emit.onEach(
      _getLeaguesUseCase.fetchLeagues(null, null),
      onData: (result) async {
        switch (result) {
          
          case Ok<List<League>>(): 
            
            return emit(LeaguesState._(
              
            ));
           
          case Error<List<League>>(): 
            return emit(
             LeaguesState.error(state, result.error.toString())
            );
           
        }
      },
      onError: addError,
    );
  }
  }