part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharachterLoaded extends CharactersState {
  final List<Character> character;
  CharachterLoaded(this.character);
}
