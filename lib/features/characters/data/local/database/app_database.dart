import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_rick/features/characters/data/local/character_dao.dart';
import 'package:flutter_rick/features/characters/data/local/character_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [CharacterEntity])
abstract class AppDatabase extends FloorDatabase {
  CharacterDao get characterDao;
}
