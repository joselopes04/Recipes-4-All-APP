import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _recipesProvider{

  List<dynamic> popularRecipes =[];
  List<dynamic> categories =[];
  List<dynamic> categoryRecipes =[];

  Future<List<dynamic>> recivePopularRecipes() async{
    final response = await rootBundle.loadString('data/recipes.json');
    Map<String,dynamic> recipesMap = json.decode(response);
    popularRecipes = recipesMap['Popular recipes'];
    return popularRecipes;
  }

  Future<List<dynamic>> reciveCategories() async{
    final response = await rootBundle.loadString('data/recipes.json');
    Map<String,dynamic> categoriesMap = json.decode(response);
    categories = categoriesMap['Categories'];
    return categories;
  }

  Future<List<dynamic>> reciveCategoryRecipes(String name) async{
    final response = await rootBundle.loadString('data/recipes.json');
    Map<String,dynamic> categoryMap = json.decode(response);
    categoryRecipes = categoryMap[name];
    return categoryRecipes;
  }

}

final recipesProvider = _recipesProvider();