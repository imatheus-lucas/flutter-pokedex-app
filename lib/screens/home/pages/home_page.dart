import 'package:flutter/material.dart';
import 'package:pokedex/common/entities/pokemon.dart';
import 'package:pokedex/common/widgets/pokemon_item.dart';
import 'package:pokedex/screens/details/container/details.container.dart';

class HomePage extends StatelessWidget {
  final List<Pokemon> pokemons;

  final Function(String, DetailArgs) onItemTap;

  const HomePage({super.key, required this.pokemons, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          title: const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Pokedex',
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: pokemons
                  .map((pokemon) => PokemonItem(
                        pokemon: pokemon,
                        onItemTap: onItemTap,
                      ))
                  .toList()),
        ));
  }
}
