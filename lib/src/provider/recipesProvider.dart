import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _recipesProvider{

  List<dynamic> popularRecipes =[];

  Future<List<dynamic>> recivePopularRecipes() async{

    final response = await rootBundle.loadString('data/recipes.json');
    Map<String,dynamic> recipesMap = json.decode(response);
    popularRecipes = recipesMap['Popular recipes'];
    return popularRecipes;
  }
}

final recipesProvider = _recipesProvider();