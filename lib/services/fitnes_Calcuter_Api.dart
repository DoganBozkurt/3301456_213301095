import 'dart:convert';
import 'package:fitness/models/calcuter.dart';
import 'package:http/http.dart' as http;

class FitnessCalcuter {
   static Future<List<Calcuter>> getRecipeCalcuter({ yas,String? boy,String? kilo})async {
    var uri = Uri.https('fitness-calculator.p.rapidapi.com', '/bmi',
        {"age": "$yas", "weight": "$kilo", "height": "$boy"});
print(boy);
    final response = await http.get(uri, headers: {
      "X-RapidAPI-Host": "fitness-calculator.p.rapidapi.com",
      "X-RapidAPI-Key": "6b31b1133amsh501e2dc3b56e553p14540ejsn016daafec7cb",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    _temp.add(data["data"]);

    return Calcuter.calcuterFromSnapshot(_temp);
  }
}
