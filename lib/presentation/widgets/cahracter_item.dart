import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/character.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CahracterItem extends StatelessWidget {
  const CahracterItem({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8.w, 8.h, 8.w, 8.h),
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: myWhite,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          charactersDetailsScreen,
          arguments: character,
        ),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name,
              style: TextStyle(
                color: myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: character.id,
            child: Container(
              color: myGrey,
              child: character.image.isNotEmpty
                  ? Image.network(
                      character.image,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return LoadingAnimationWidget.threeRotatingDots(
                          size: 50,
                          color: Colors.amberAccent,
                         
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error, color: Colors.red, size: 24.r);
                      },
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
