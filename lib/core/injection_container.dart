import 'package:dio/dio.dart';
import 'package:flutter_rick/features/characters/data/character_repository_impl.dart';
import 'package:flutter_rick/features/characters/data/remote/characters_api_service.dart';
import 'package:flutter_rick/features/characters/domain/character_repository.dart';
import 'package:flutter_rick/features/characters/domain/usecases/get_all_characters.dart';
import 'package:flutter_rick/features/characters/presentation/bloc/all/all_characters_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<CharactersApiService>(
      () => CharactersApiService(sl()));
  sl.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(sl()));

  sl.registerLazySingleton<GetAllCharactersUseCase>(
      () => GetAllCharactersUseCase(sl()));

  sl.registerFactory<AllCharactersBloc>(() => AllCharactersBloc(sl()));
}
