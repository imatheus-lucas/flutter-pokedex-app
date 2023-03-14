import 'package:flutter/material.dart';
import 'package:pokedex/common/entities/pokemon.dart';
import 'package:pokedex/common/widgets/pokemon_type.dart';
import 'package:pokedex/screens/details/container/details.container.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;
  final Function(String, DetailArgs) onItemTap;

  const PokemonItem(
      {super.key, required this.pokemon, required this.onItemTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onItemTap('/details', DetailArgs(pokemon: pokemon)),
        child: Stack(children: [
          Container(
              decoration: BoxDecoration(
                  color: pokemon.baseColor!.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(pokemon.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Text('#${pokemon.num}',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: pokemon.type
                              .map((name) => PokemonType(name: name))
                              .toList(),
                        ),
                        const Flexible(
                            child: SizedBox(
                          height: 100,
                          width: 100,
                        ))
                      ],
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 12,
            right: 8,
            child: Image.network(pokemon.image, fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            }),
          )
        ]));
  }
}
