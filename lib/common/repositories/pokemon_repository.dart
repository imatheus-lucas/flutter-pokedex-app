import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedex/common/entities/pokemon.dart';
import 'package:pokedex/common/error/failure.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(
          'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;

      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (err) {
      log(err.toString());
      throw Failure(message: "Não foi possível carregar os pokemons");
    }
  }
}
