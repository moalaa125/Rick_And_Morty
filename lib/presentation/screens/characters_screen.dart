import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty/constants/my_colors.dart';
import 'package:rickandmorty/data/models/character.dart';
import 'package:rickandmorty/presentation/widgets/cahracter_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CharactersScreen> {
  List<Character> allCharacters = [];
  List<Character> searchForCharacters = [];
  bool _isSearching = false;
  final serachTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: serachTextController,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: 'Find a Character.....',
        border: InputBorder.none,
        hintStyle: TextStyle(color: myGrey, fontSize: 18.sp),
      ),
      style: TextStyle(color: Colors.black, fontSize: 18.sp),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearcedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearcedList(String searchedCharacters) {
    searchForCharacters = allCharacters
        .where(
          (character) => character.name.toLowerCase().startsWith(
            searchedCharacters.toLowerCase(),
          ),
        )
        .toList();

    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: Colors.black, size: 24.r),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search, color: Colors.black, size: 24.r),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      serachTextController.clear();
    });
  }

  Widget _buildNoInternet() {
    return Center(
      child: Container(
        color: myWhite,
        child: Column(
          children: [
            Image.asset('assets/images/error.png'),
            SizedBox(height: 10.h),
            Text(
              'No internet Connection Pleas Check and try again !',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buldBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharachterLoaded) {
          allCharacters = state.character;
          return buildLoadedListWidget();
        } else {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              size: 50,
              color: myYellow,
            ),
          );
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    final bool isSearchingWithNoResults =
        serachTextController.text.isNotEmpty && searchForCharacters.isEmpty;
    return SingleChildScrollView(
      child: Container(
        color: myGrey,
        child: Column(
          children: [
            isSearchingWithNoResults
                ? _buildNoResultsWidget(context)
                : buildChacactersList(),
          ],
        ),
      ),
    );
  }

  Widget _buildNoResultsWidget(BuildContext context) {
    final double availableHeight =
        MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;

    return SizedBox(
      height: availableHeight,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.search_off, size: 60.r, color: Colors.black38),
            SizedBox(height: 12.h),
            Text(
              'No characters found',
              style: TextStyle(fontSize: 18.sp, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChacactersList() {
    return GridView.builder(
      itemCount: serachTextController.text.isEmpty
          ? allCharacters.length
          : searchForCharacters.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2.5,
        crossAxisSpacing: 1.w,
        mainAxisSpacing: 1.h,
      ),
      itemBuilder: (context, index) {
        return CahracterItem(
          character: serachTextController.text.isEmpty
              ? allCharacters[index]
              : searchForCharacters[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myYellow,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder:
            (
              BuildContext context,
              List<ConnectivityResult> connectivity,
              Widget child,
            ) {
              final bool connected = !connectivity.contains(
                ConnectivityResult.none,
              );

              if (connected) {
                return buldBlocWidget();
              } else {
                return _buildNoInternet();
              }
            },
        child: Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            size: 50,
            color: myYellow,
          ),
        ),
        // ,
      ),
    );
  }
}
