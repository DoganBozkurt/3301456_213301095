import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fitness/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('exercisedb.p.rapidapi.com', '/exercises');

    final response = await http.get(uri, headers: {
    "X-RapidAPI-Host": "exercisedb.p.rapidapi.com",
	"X-RapidAPI-Key": "6b31b1133amsh501e2dc3b56e553p14540ejsn016daafec7cb",
	"useQueryString": "true"
    });

    var data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data) {
      _temp.add(i);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}