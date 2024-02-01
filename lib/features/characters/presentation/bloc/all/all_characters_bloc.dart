import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick/core/resources/data_state.dart';
import 'package:flutter_rick/features/characters/domain/usecases/get_all_characters.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/all/all_characters_event.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/all/all_characters_state.dart';

class AllCharactersBloc extends Bloc<AllCharactersEvent, AllCharactersState> {
  final GetAllCharactersUseCase _getAllCharactersUseCase;

  AllCharactersBloc(this._getAllCharactersUseCase)
      : super(const AllCharactersLoading()) {
    on<GetAllCharacters>(_onGetAllCharacters);
  }

  void _onGetAllCharacters(
      GetAllCharacters event, Emitter<AllCharactersState> emit) async {
    final dataState = await _getAllCharactersUseCase();

    if (dataState is DataSuccess) {
      if (dataState.data!.isEmpty) {
        emit(const AllCharactersEmpty());
      } else {
        emit(AllCharactersSuccess(dataState.data!));
      }
    }

    if (dataState is DataFailed) {
      emit(AllCharactersFailure(dataState.exception!));
    }
  }
}
