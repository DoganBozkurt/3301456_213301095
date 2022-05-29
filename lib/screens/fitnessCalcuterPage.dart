import 'package:fitness/constants.dart';
import 'package:fitness/models/calcuter.dart';
import 'package:fitness/models/calcuterCard.dart';
import 'package:fitness/services/fitnes_Calcuter_Api.dart';
import 'package:flutter/material.dart';

class CalcuterPage extends StatefulWidget {
  static const String sayfaName = "/CalcuterPage";
  const CalcuterPage({Key? key}) : super(key: key);

  @override
  State<CalcuterPage> createState() => _CalcuterPageState();
}

class _CalcuterPageState extends State<CalcuterPage> {
  late List<Calcuter> _calcuter;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getCalcuter();
  }
   Future<void> getCalcuter() async {
    _calcuter = await FitnessCalcuter.getRecipeCalcuter(yas: secilenYas.toString(),kilo: secilenKilo.toString(),boy: secilenBoy.toString());
    setState(() {
      _isLoading = false;
    });
    print(_calcuter);
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
              Icon(Icons.calculate),
              SizedBox(width: 10),
              Text('CALCULATOR')
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
                  itemCount: _calcuter.length,
                  itemBuilder: (context, index) {
                    return CalcuterCard(
                        bmi: _calcuter[index].bmi.toString(),
                        saglik: _calcuter[index].saglik,
                        normalAralik: _calcuter[index].normalAralik);
                  },
                ),
        ));
  }
}
