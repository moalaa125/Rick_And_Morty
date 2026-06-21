import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickandmorty/constants/my_colors.dart';
import 'package:rickandmorty/data/models/character.dart';

class CharactersDetails extends StatelessWidget {
  const CharactersDetails({super.key, required this.character});

  final Character character;

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600.h,
      pinned: true,
      stretch: true,
      backgroundColor: myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(character.name, style: TextStyle(color: myWhite, fontSize: 20.sp)),
        background: Hero(
          tag: character.id,
          child: Image.network(character.image, fit: BoxFit.fill),
        ),
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
              fontSize: 18.sp,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: myWhite, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildDevider({required double endIndent}) {
    return Divider(
      color: myYellow,
      height: 30.h,
      endIndent: endIndent.w,
      thickness: 3.h,
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
                margin: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 0),
                padding: EdgeInsets.all(8.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _characterInfo(title: 'Status: ', value: character.status),
                    _buildDevider(endIndent: 260),
                    SizedBox(height: 15.h),

                    _characterInfo(
                      title: 'Species: ',
                      value: character.species,
                    ),

                    _buildDevider(endIndent: 250),
                    SizedBox(height: 15.h),

                    _characterInfo(title: 'Gender: ', value: character.gender),
                    _buildDevider(endIndent: 260),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              SizedBox(height: 700.h),
            ]),
          ),
        ],
      ),
    );
  }
}