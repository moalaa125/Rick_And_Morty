import 'package:flutter/material.dart';
import 'package:rickandmorty/constants/my_colors.dart';
import 'package:rickandmorty/data/models/character.dart';

class CharactersDetails extends StatelessWidget {
  const CharactersDetails({super.key, required this.character});

  final Character character;

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 750,
      pinned: true,
      stretch: true,
      backgroundColor: myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(character.name, style: TextStyle(color: myWhite)),
        background: Hero(
          tag: character.id,
          child: Image.network(character.image, fit: BoxFit.cover)),
      ),
    );
  }

  Widget _characterInfo({required String title, required String value}) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: myWhite, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildDevider({required double endIdet}) {
    return Divider(
      color: myYellow,
      height: 30,
      endIndent: endIdet,
      thickness: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),

          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _characterInfo(title: 'Status: ', value: character.status),
                    _buildDevider(endIdet: 315),
                    SizedBox(height: 15),

                    _characterInfo(
                      title: 'species: ',
                      value: character.species,
                    ),

                    _buildDevider(endIdet: 300),
                    SizedBox(height: 15),

                    _characterInfo(title: 'Gender: ', value: character.gender),
                    _buildDevider(endIdet: 305),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 700),
            ]),
          ),
        ],
      ),
    );
  }
}
