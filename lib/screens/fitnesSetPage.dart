
import 'package:fitness/constants.dart';
import 'package:fitness/models/recipe.dart';
import 'package:fitness/services/recipe_Api.dart';
import 'package:fitness/models/recipe_card.dart';
import 'package:flutter/material.dart';

class FitnesSetPage extends StatefulWidget {
    static const String sayfaName = "/FitnesSetPage";

  @override
  _FitnesSetPageState createState() => _FitnesSetPageState();
}

class _FitnesSetPageState extends State<FitnesSetPage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color.fromRGBO(19, 20, 41, 0.95),
                Color.fromRGBO(19, 20, 41, 1),
              ])),
        ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.fitness_center),
              SizedBox(width: 10),
              Text('FİTNES SET')
            ],
          ),
        ),
        bottomNavigationBar: AltMenu(),
        body: Container(
           decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                Color.fromRGBO(19, 20, 41, 1),
                Color.fromRGBO(19, 20, 41, 1),
              ])),
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                        name: _recipes[index].name,
                        bodyPart: _recipes[index].bodyPart,
                        target: _recipes[index].target,
                        gifUrl: _recipes[index].gifUrl);
                  },
                ),
        ));
  }
}