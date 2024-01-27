import 'package:dio/dio.dart';
import 'package:flutter_rick/core/utils/constants.dart';
import 'package:flutter_rick/features/characters/data/remote/characters_api_response.dart';
import 'package:retrofit/retrofit.dart';

part 'characters_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class CharactersApiService {
  factory CharactersApiService(Dio dio, {String baseUrl}) =
      _CharactersApiService;

  @GET('/character')
  Future<HttpResponse<CharactersApiResponse>> getAllCharacters({
    @Query("page") int? page,
  });
}
