import 'package:dio/dio.dart';
import 'package:flutter_rick/core/utils/constants.dart';
import 'package:flutter_rick/features/characters/data/character_repository_impl.dart';
import 'package:flutter_rick/features/characters/data/local/database/app_database.dart';
import 'package:flutter_rick/features/characters/data/remote/service/characters_api_service.dart';
import 'package:flutter_rick/features/characters/domain/character_repository.dart';
import 'package:flutter_rick/features/characters/domain/usecases/get_all_characters.dart';
import 'package:flutter_rick/features/characters/domain/usecases/get_favorite_characters.dart';
import 'package:flutter_rick/features/characters/domain/usecases/save_favorite_character.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/all/all_characters_bloc.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/favorite/favorite_characters_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<CharactersApiService>(
      () => CharactersApiService(sl()));
  sl.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(sl(), sl()));

  final database =
      await $FloorAppDatabase.databaseBuilder(databaseName).build();
  sl.registerLazySingleton<AppDatabase>(() => (database));

  sl.registerLazySingleton<GetAllCharactersUseCase>(
      () => GetAllCharactersUseCase(sl()));
  sl.registerLazySingleton<GetFavoriteCharactersUseCase>(
      () => GetFavoriteCharactersUseCase(sl()));
  sl.registerLazySingleton<SaveFavoriteCharacterUseCase>(
      () => SaveFavoriteCharacterUseCase(sl()));

  sl.registerFactory<AllCharactersBloc>(() => AllCharactersBloc(sl()));
  sl.registerFactory<FavoriteCharactersBloc>(
      () => FavoriteCharactersBloc(sl(), sl()));
}
