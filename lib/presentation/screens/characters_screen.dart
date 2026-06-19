import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty/constants/my_colors.dart';
import 'package:rickandmorty/data/models/character.dart';
import 'package:rickandmorty/presentation/widgets/cahracter_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CharactersScreen> {
  List<Character> allCharacters = [];

  @override
  void initState() {
    super.initState();

    allCharacters = BlocProvider.of<CharactersCubit>(
      context,
    ).getAllCharacters();
  }

  Widget buldBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharachterLoaded) {
          allCharacters = (state).character;
          return buildLoadedListWidget();
        } else {
          return Center(child: CircularProgressIndicator(color: Colors.amber,));
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: myGrey,
        child: Column(children: [buildChacactersList()]),
      ),
    );
  }

  Widget buildChacactersList() {
    return GridView.builder(
      itemCount: allCharacters.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return CahracterItem(character: allCharacters[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myYellow,
        title: Text(
          'Characters',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: buldBlocWidget(),
    );
  }
}
