import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String name;
  final String image;
  final List<String> type;
  final String num;
  Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.num,
  });
  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      name: map['name'],
      image: map['img'],
      num: map['num'],
      type: List<String>.from(map['type']),
    );
  }
  // Color? get baseColor => _color(type: type[0]);
  // String get image =>
  //     'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';

  Color? get baseColor => _color(type: type[0]);
  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}