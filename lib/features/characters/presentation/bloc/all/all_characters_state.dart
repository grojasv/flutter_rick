import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rick/features/characters/domain/models/character_model.dart';

abstract class AllCharactersState extends Equatable {
  final List<CharacterModel>? characters;
  final DioException? exception;

  const AllCharactersState({this.characters, this.exception});

  @override
  List<Object> get props => [characters!, exception!];
}

class AllCharactersLoading extends AllCharactersState {
  const AllCharactersLoading();
}

class AllCharactersEmpty extends AllCharactersState {
  const AllCharactersEmpty();
}

class AllCharactersSuccess extends AllCharactersState {
  const AllCharactersSuccess(List<CharacterModel> characters)
      : super(characters: characters);
}

class AllCharactersFailure extends AllCharactersState {
  const AllCharactersFailure(DioException exception)
      : super(exception: exception);
}
