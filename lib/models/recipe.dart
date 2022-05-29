class Recipe {
  final String? name;
  final String? gifUrl;
  final String? target;
  final String? bodyPart;

  Recipe({this.name, this.gifUrl, this.target, this.bodyPart});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        gifUrl: json['gifUrl']as String,
        target: json['target'] as String,
        bodyPart: json['bodyPart'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, gifUrl: $gifUrl, target: $target, bodyPart: $bodyPart}';
  }
}