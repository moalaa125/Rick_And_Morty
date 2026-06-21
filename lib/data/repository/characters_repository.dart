import '../api/characters_api.dart';
import '../models/character.dart';

class CharactersRepository {
  final CharactersApi charactersApi;

  CharactersRepository(this.charactersApi);

  Future<List<Character>> getAllCharacters() async {
    final charactersList = await charactersApi.getAllCharacters();
    return charactersList
        .map((characterJson) => Character.fromJson(characterJson))
        .toList();
  }
}
