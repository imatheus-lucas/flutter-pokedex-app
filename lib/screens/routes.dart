import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/screens/details/container/details.container.dart';
import 'package:pokedex/screens/home/container/home_container.dart';

class Routes extends StatelessWidget {
  final PokemonRepository repository;
  const Routes({super.key, required this.repository});
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => HomeContainer(
                    repository: repository,
                    onItemTap: (route, args) {
                      Navigator.of(context).pushNamed(route, arguments: args);
                    }));
          case '/details':
            return MaterialPageRoute(
                builder: (_) => DetailsContainer(
                      repository: repository,
                      arguments: settings.arguments as DetailArgs,
                    ));

          default:
            return MaterialPageRoute(builder: (_) => Container());
        }
      },
    );
  }
}
