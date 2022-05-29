import 'package:fitness/screens/fitnessCalcuterPage.dart';
import 'package:fitness/services/fitnes_Calcuter_Api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalcuterCard extends StatefulWidget {
  final String? bmi;
  final String? saglik;
  final String? normalAralik;
  CalcuterCard({
    @required this.bmi,
    @required this.saglik,
    @required this.normalAralik,
  });

  @override
  State<CalcuterCard> createState() => _CalcuterCardState();
}

int secilenBoy = 180;
int secilenKilo = 75;
int secilenYas = 25;

class _CalcuterCardState extends State<CalcuterCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 600,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromRGBO(19, 20, 41, 1),
              Color.fromRGBO(19, 20, 41, 1),
            ])),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(95, 0, 108, 1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.weight,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text("KİLONUZ: $secilenKilo",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 3, left: 3),
                                child: ButtonTheme(
                                  child: OutlinedButton(
                                    style: buttonStyle(),
                                    onPressed: () {
                                      setState(() {
                                        secilenKilo++;
                                      });
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 3, left: 3),
                                child: ButtonTheme(
                                  child: OutlinedButton(
                                    style: buttonStyle(),
                                    onPressed: () {
                                      setState(() {
                                        secilenKilo--;
                                      });
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2.5,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(95, 0, 108, 1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.restroom,
                          color: Colors.white,
                          size: 45,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text("BOYUNUZ: $secilenBoy",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 3, left: 3),
                                child: ButtonTheme(
                                  child: OutlinedButton(
                                    style: buttonStyle(),
                                    onPressed: () {
                                      setState(() {
                                        secilenBoy++;
                                      });
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 3, left: 3),
                                child: ButtonTheme(
                                  child: OutlinedButton(
                                    style: buttonStyle(),
                                    onPressed: () {
                                      setState(() {
                                        secilenBoy--;
                                      });
                                    },
                                    child: const Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(95, 0, 108, 1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.birthdayCake,
                        color: Colors.white,
                        size: 45,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text("YAŞINIZ: $secilenYas",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 3, left: 3),
                              child: ButtonTheme(
                                child: OutlinedButton(
                                  style: buttonStyle(),
                                  onPressed: () {
                                    setState(() {
                                      secilenYas++;
                                    });
                                  },
                                  child: const Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 3, left: 3),
                              child: ButtonTheme(
                                child: OutlinedButton(
                                  style: buttonStyle(),
                                  onPressed: () {
                                    setState(() {
                                      secilenYas--;
                                    });
                                  },
                                  child: const Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "SONUÇLARINIZ",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(95, 0, 108, 1),
                    ),
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Bmi Sonucunuz= ${widget.bmi}",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(95, 0, 108, 1),
                      ),
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sağlık Durumunuz= ${widget.saglik}",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(95, 0, 108, 1),
                    ),
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Olması Gereken Bmi= ${widget.normalAralik}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                height: 80,
                child: OutlinedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    setState(() {
                      FitnessCalcuter.getRecipeCalcuter(
                          yas: secilenYas.toString(),
                          kilo: secilenKilo.toString(),
                          boy: secilenBoy.toString());
                      Navigator.pushNamed(context, CalcuterPage.sayfaName);
                    });
                  },
                  child: Text(
                    "HESAPLA",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  ButtonStyle buttonStyle() {
    return OutlinedButton.styleFrom(
      backgroundColor: const Color(0xff4338CA),
      side: const BorderSide(
        width: 1.5,
        color: Colors.white,
        style: BorderStyle.solid,
      ),
    );
  }
}
