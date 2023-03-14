import 'package:flutter/cupertino.dart';
import 'package:pokedex/common/entities/pokemon.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/common/widgets/error.dart';
import 'package:pokedex/common/widgets/loading.dart';
import 'package:pokedex/screens/details/pages/details_page.dart';

class DetailArgs {
  final Pokemon pokemon;

  DetailArgs({required this.pokemon});
}

class DetailsContainer extends StatelessWidget {
  final IPokemonRepository repository;
  final DetailArgs arguments;

  const DetailsContainer(
      {super.key, required this.repository, required this.arguments});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailsPage(pokemon: arguments.pokemon);
          }
          if (snapshot.hasError) {
            return ErrorPage(error: (snapshot.error as Failure).message);
          }

          return Container();
        }));
  }
}
