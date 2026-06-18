import 'package:flutter/material.dart';
import 'package:rickandmorty/app_router.dart';

void main() {
  runApp(RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  RickAndMorty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
