class Calcuter{
  final double? bmi;
  final String? saglik;
  final String? normalAralik;
  Calcuter({this.bmi,this.saglik,this.normalAralik});

  factory Calcuter.fromJson(dynamic json){
    return Calcuter(
      bmi: json["bmi"] as double,
      saglik: json["health"] as String,
      normalAralik: json["healthy_bmi_range"] as String
    );}

   static List<Calcuter> calcuterFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Calcuter.fromJson(data);
    }).toList();
  }

 @override
  String toString(){
    return 'Calcuter {bmi: $bmi, saglik: $saglik, normalAralik: $normalAralik}';
  }
  
}