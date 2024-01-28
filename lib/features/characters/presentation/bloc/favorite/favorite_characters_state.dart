import 'package:equatable/equatable.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

abstract class FavoriteCharactersState extends Equatable {
  final List<CharacterModel>? characters;

  const FavoriteCharactersState({this.characters});

  @override
  List<Object> get props => [characters!];
}

class FavoriteCharactersLoading extends FavoriteCharactersState {
  const FavoriteCharactersLoading();
}

class FavoriteCharactersSuccess extends FavoriteCharactersState {
  const FavoriteCharactersSuccess(List<CharacterModel> characters)
      : super(characters: characters);
}
