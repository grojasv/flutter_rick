import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick/features/characters/domain/usecases/get_favorite_characters.dart';
import 'package:flutter_rick/features/characters/domain/usecases/save_favorite_character.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/favorite/favorite_characters_event.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/favorite/favorite_characters_state.dart';

class FavoriteCharactersBloc
    extends Bloc<FavoriteCharactersEvent, FavoriteCharactersState> {
  final GetFavoriteCharactersUseCase _getFavoriteCharactersUseCase;
  final SaveFavoriteCharacterUseCase _saveFavoriteCharacterUseCase;

  FavoriteCharactersBloc(
    this._getFavoriteCharactersUseCase,
    this._saveFavoriteCharacterUseCase,
  ) : super(const FavoriteCharactersLoading()) {
    on<GetFavoriteCharacters>(onGetFavoriteCharacters);
    on<SaveFavorite>(onSaveFavoriteCharacter);
  }

  void onGetFavoriteCharacters(GetFavoriteCharacters getFavoriteCharacters,
      Emitter<FavoriteCharactersState> emit) async {
    final characters = await _getFavoriteCharactersUseCase();
    emit(FavoriteCharactersSuccess(characters));
  }

  void onSaveFavoriteCharacter(
      SaveFavorite saveFavorite, Emitter<FavoriteCharactersState> emit) async {
    await _saveFavoriteCharacterUseCase(params: saveFavorite.character);
    final characters = await _getFavoriteCharactersUseCase();
    emit(FavoriteCharactersSuccess(characters));
  }
}
