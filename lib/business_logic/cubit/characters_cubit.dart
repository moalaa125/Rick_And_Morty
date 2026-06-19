import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/data/models/character.dart';
import 'package:rickandmorty/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;

  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((charactersList) {
      characters = charactersList;
      emit(CharachterLoaded(charactersList));
    });
    return characters;
  }
}
