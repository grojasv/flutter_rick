import 'package:floor/floor.dart';

@entity
class CharacterEntity {
  @primaryKey
  int id = 0;
  String name = "";
  String gender = "";
  String origin = "";
  String image = "";
  String status = "";
  String species = "";

  CharacterEntity(
      {required this.id,
      required this.name,
      required this.gender,
      required this.origin,
      required this.image,
      required this.status,
      required this.species});
}
