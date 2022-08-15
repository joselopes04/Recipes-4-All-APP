import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _recipesProvider {
  List<dynamic> allRecipes = [];
  List<dynamic> categories = [];
  List<dynamic> categoryRecipes = [];

  Future<List<dynamic>> reciveAllRecipes() async {
    final response = await rootBundle.loadString('data/recipes.json');
    Map<String, dynamic> recipesMap = json.decode(response);
    allRecipes = recipesMap['All Recipes'];
    return allRecipes;
  }

  Future<List<dynamic>> reciveCategories() async {
    final response = await rootBundle.loadString('data/recipes.json');
    Map<String, dynamic> categoriesMap = json.decode(response);
    categories = categoriesMap['Categories'];
    return categories;
  }

  Future<List<dynamic>> reciveCategoryRecipes(String name) async {
    final response = await rootBundle.loadString('data/recipes.json');
    Map<String, dynamic> categoryMap = json.decode(response);
    categoryRecipes = categoryMap[name];
    return categoryRecipes;
  }
}

final recipesProvider = _recipesProvider();
