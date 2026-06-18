import 'package:rickandmorty/data/api/characters_api.dart';
import 'package:rickandmorty/data/models/characters.dart';

class CharactersRepository {
  final CharactersApi charactersApi;

  CharactersRepository(this.charactersApi);

  Future<List<dynamic>> getAllCharacters() async {
    final charactersList = await charactersApi.getAllCharacters();
    return charactersList
        .map((characterJson) => Characters.fromJson(characterJson))
        .toList();
  }
}
