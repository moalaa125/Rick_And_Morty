import 'package:flutter/material.dart';
import 'package:rickandmorty/constants/my_colors.dart';
import 'package:rickandmorty/data/models/character.dart';

class CahracterItem extends StatelessWidget {
  const CahracterItem({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: myWhite,
        borderRadius: BorderRadius.circular(8),
      ),

      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            '${character.name}',
            style: TextStyle(color: myWhite, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: myGrey,
          child: character.image.isNotEmpty
              ? Image.network(character.image, fit: BoxFit.cover  )
              : CircularProgressIndicator(color: Colors.amberAccent,),
        ),
      ),
    );
  }
}
