import 'package:flutter/cupertino.dart';
import 'package:pokedex/common/entities/pokemon.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/screens/details/container/details.container.dart';
import 'package:pokedex/screens/home/pages/home_error.dart';
import 'package:pokedex/screens/home/pages/home_loading.dart';
import 'package:pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  final IPokemonRepository repository;

  final Function(String, DetailArgs) onItemTap;

  const HomeContainer(
      {super.key, required this.repository, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomeLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(pokemons: snapshot.data!, onItemTap: onItemTap);
          }
          if (snapshot.hasError) {
            return HomeError(error: (snapshot.error as Failure).message);
          }

          return Container();
        }));
  }
}
