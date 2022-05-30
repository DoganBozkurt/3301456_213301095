import 'package:fitness/constants.dart';
import 'package:fitness/models/raporlar.dart';
import 'package:fitness/models/raporlar_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class RaporlarPage extends StatefulWidget {
  static const String sayfaName = "/RaporlarPage";

  @override
  State<RaporlarPage> createState() => _RaporlarPageState();
}

class _RaporlarPageState extends State<RaporlarPage> {
  HomeControl control = HomeControl();
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
          children: [Icon(Icons.feed), SizedBox(width: 10), Text('KİLO TAKİP')],
        ),
      ),
      bottomNavigationBar: const AltMenu(),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromRGBO(19, 20, 41, 1),
              Color.fromRGBO(19, 20, 41, 1),
            ])),
        child: Consumer<RaporlarState>(builder: (context, state, width) {
          var raporlar = state.raporlar;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "ŞUANKİ KİLONUZ",
                        textScaleFactor: 1.7,
                        style: beyazTextStyle,
                      ),
                      Text(
                        raporlar.first.value.toString(),
                        style: beyazTextStyle,
                      )
                    ]),
              ),
              Expanded(
                flex: 3,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, index) {
                    var rapor = raporlar[index];
                    return ListTile(
                      title: Text(
                        "${rapor.time?.day}.${rapor.time?.month}.${rapor.time?.year}",
                        style: beyazTextStyle,
                      ),
                      trailing: Text(
                        rapor.value.toString(),
                        textScaleFactor: 2,
                        style: beyazTextStyle,
                      ),
                    );
                  },
                  itemCount: raporlar.length,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Obx(() => Text(
                          "Seçilen Kio: ${control.deger.value}",
                          style: beyazTextStyle,
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(123, 39, 163, 1),
                          shadowColor: Color.fromRGBO(200, 47, 129, 1),
                        ),
                        onPressed: () async {
                          var state =
                              Provider.of<RaporlarState>(context, listen: false);
                          var result = await _showAddWeightDialog(
                              context, state.currentWeight.value!);
                        },
                        child: const Text("KİLONUZU SEÇİNİZ")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(194, 46, 131, 1),
                          shadowColor: Color.fromRGBO(128, 39, 161, 1),
                        ),
                        onPressed: () {
                          if (control.deger.value != null &&
                              control.deger.value > 0) {
                            state.add(Raporlar(
                                value: control.deger.value,
                                time: DateTime.now()));
                          }
                        },
                        child: const Text("KİLONUZU KAYDEDİNİZ")),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Future<double?> _showAddWeightDialog(
      BuildContext context, double currentWeight) {
    return showDialog<double>(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                (() => DecimalNumberPicker(
                      minValue: 20,
                      maxValue: 200,
                      haptics: true,
                      value: control.deger.value,
                      axis: Axis.horizontal,
                      onChanged: (value) {
                        control.deger.value = value;
                      },
                    )),
              ),
            ],
          );
        });
  }
}
