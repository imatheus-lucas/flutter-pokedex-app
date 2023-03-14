import 'package:flutter/material.dart';
import 'package:pokedex/common/entities/pokemon.dart';

class DetailsPage extends StatelessWidget {
  final Pokemon pokemon;
  const DetailsPage({super.key, required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(pokemon.image))
                        ]),
                  ))
            ],
          ),
        ));
  }
}
