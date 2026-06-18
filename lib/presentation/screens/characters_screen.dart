import 'package:flutter/material.dart';
import 'package:rickandmorty/data/api/characters_api.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _MyWidgetState();
}
CharactersApi charactersApi = CharactersApi();
class _MyWidgetState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Characters'), ),
      body: Container(
        color: Colors.amber,
        height: 200 ,
        width: 200,
        child: GestureDetector(
          onTap: charactersApi.getAllCharacters,
        ),
      ),
    );
  }
}