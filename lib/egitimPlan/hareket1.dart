import 'package:fitness/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Hareket1 extends StatelessWidget {
  static const String sayfaName = "/Hareket1";
  final Kullanici kullanici_1;
  Hareket1(this.kullanici_1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Container(
        margin: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomePage1.sayfaName);
                    },
                    child: const Icon(
                      FontAwesomeIcons.longArrowAltLeft,
                      size: 40,
                      color: Color.fromRGBO(95, 0, 108, 1),
                    ))),
            const SizedBox(
              width: 3.2,
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("BAŞLA",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(95, 0, 108, 1),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold))),
            )
          ],
        ),
      )),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        const Color.fromRGBO(95, 0, 108, 1).withOpacity(0.5),
                        BlendMode.srcOver),
                    image: const AssetImage("lib/assets/images/gogusKaslari.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${kullanici_1.secilenButton}",
                      textAlign: TextAlign.end,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                child: kullanici_1.sayi == 1
                    ? const Text("20 dakika-> 4 egzersiz",
                        style: TextStyle(
                            color: Color.fromRGBO(95, 0, 108, 1), fontSize: 16))
                    : kullanici_1.sayi == 2
                        ? const Text("30 dakika-> 4 egzersiz",
                            style: TextStyle(
                                color: Color.fromRGBO(95, 0, 108, 1),
                                fontSize: 16))
                        : kullanici_1.sayi == 3
                            ? const Text("40 dakika-> 4 egzersiz",
                                style: TextStyle(
                                    color: Color.fromRGBO(95, 0, 108, 1),
                                    fontSize: 16))
                            : const Text("HATALI GİRİŞ",
                                style: TextStyle(
                                    color: Color.fromRGBO(95, 0, 108, 1),
                                    fontSize: 16))),
            Expanded(
              flex: 5,
              child: kullanici_1.secilenCalisma == "gogusHareketi"
                  ? ListView(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                "lib/assets/gif/gogusKaslari/1.gif",
                                height: 125.0,
                                width: 125.0,
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                "barbell bench press ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            Expanded(
                              child: seviyeSet(),
                            )
                          ],
                        ),
                        const Divider(
                          height: 2,
                          color: Colors.blue,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                "lib/assets/gif/gogusKaslari/2.gif",
                                height: 125.0,
                                width: 125.0,
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                "Cable crossover",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            Expanded(
                              child: seviyeSet(),
                            )
                          ],
                        ),
                        const Divider(
                          height: 2,
                          color: Colors.blue,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                "lib/assets/gif/gogusKaslari/3.gif",
                                height: 125.0,
                                width: 125.0,
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                "Chest dip",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            Expanded(
                              child: seviyeSet(),
                            )
                          ],
                        ),
                        const Divider(
                          height: 2,
                          color: Colors.blue,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                "lib/assets/gif/gogusKaslari/4.gif",
                                height: 125.0,
                                width: 125.0,
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                "Dumbbell fly",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            Expanded(
                              child: seviyeSet(),
                            )
                          ],
                        ),
                      ],

                    )
                  : kullanici_1.secilenCalisma == "kolHareketi"
                      ? ListView(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    "lib/assets/gif/kolKaslari/1.gif",
                                    height: 125.0,
                                    width: 125.0,
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    "Barbell front raise",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                  child: seviyeSet(),
                                )
                              ],
                            ),
                            const Divider(
                              height: 2,
                              color: Colors.blue,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    "lib/assets/gif/kolKaslari/2.gif",
                                    height: 125.0,
                                    width: 125.0,
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    "Dumbbell shoulder press",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                  child: seviyeSet(),
                                )
                              ],
                            ),
                          ],
                        )
                      : kullanici_1.secilenCalisma == "sirtHareketi"
                          ? ListView(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "lib/assets/gif/sirtKaslari/1.gif",
                                        height: 125.0,
                                        width: 125.0,
                                      ),
                                    ),
                                    const Expanded(
                                      child: Text(
                                        "Cable lat pulldown",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ),
                                    Expanded(
                                      child: seviyeSet(),
                                    )
                                  ],
                                ),
                                const Divider(
                                  height: 2,
                                  color: Colors.blue,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "lib/assets/gif/sirtKaslari/2.gif",
                                        height: 125.0,
                                        width: 125.0,
                                      ),
                                    ),
                                    const Expanded(
                                      child: Text(
                                        "Cable lat pulldown",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ),
                                    Expanded(
                                      child: seviyeSet(),
                                    )
                                  ],
                                ),
                                const Divider(
                                  height: 2,
                                  color: Colors.blue,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "lib/assets/gif/sirtKaslari/3.gif",
                                        height: 125.0,
                                        width: 125.0,
                                      ),
                                    ),
                                    const Expanded(
                                      child: Text(
                                        "Chin up",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ),
                                    Expanded(
                                      child: seviyeSet(),
                                    )
                                  ],
                                ),
                                const Divider(
                                  height: 2,
                                  color: Colors.blue,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "lib/assets/gif/sirtKaslari/4.gif",
                                        height: 125.0,
                                        width: 125.0,
                                      ),
                                    ),
                                    const Expanded(
                                      child: Text(
                                        "Chip up",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ),
                                    Expanded(
                                      child: seviyeSet(),
                                    )
                                  ],
                                ),
                              ],
                            )
                          : kullanici_1.secilenCalisma == "karinHareketi"
                              ? ListView(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            "lib/assets/gif/karinKaslari/1.gif",
                                            height: 125.0,
                                            width: 125.0,
                                          ),
                                        ),
                                        const Expanded(
                                          child: Text(
                                            "Bicycle crunch",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Expanded(
                                          child: seviyeSet(),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 2,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            "lib/assets/gif/karinKaslari/2.gif",
                                            height: 125.0,
                                            width: 125.0,
                                          ),
                                        ),
                                        const Expanded(
                                          child: Text(
                                            "Bird dog",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Expanded(
                                          child: seviyeSet(),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 2,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            "lib/assets/gif/karinKaslari/3.gif",
                                            height: 125.0,
                                            width: 125.0,
                                          ),
                                        ),
                                       const Expanded(
                                          child: Text(
                                            "Birdge",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Expanded(
                                          child: seviyeSet(),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 2,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            "lib/assets/gif/karinKaslari/4.gif",
                                            height: 125.0,
                                            width: 125.0,
                                          ),
                                        ),
                                      const Expanded(
                                          child: Text(
                                            "Push up",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Expanded(
                                          child: seviyeSet(),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              : ListView(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            "lib/assets/gif/bacakKaslari/1.gif",
                                            height: 125.0,
                                            width: 125.0,
                                          ),
                                        ),
                                       const Expanded(
                                          child: Text(
                                            "Barbell squat",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Expanded(
                                          child: seviyeSet(),
                                        )
                                      ],
                                    ),
                                   const Divider(
                                      height: 2,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            "lib/assets/gif/bacakKaslari/2.gif",
                                            height: 125.0,
                                            width: 125.0,
                                          ),
                                        ),
                                       const Expanded(
                                          child: Text(
                                            "Leg Extension",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Expanded(
                                          child: seviyeSet(),
                                        )
                                      ],
                                    ),
                                   const Divider(
                                      height: 2,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            "lib/assets/gif/bacakKaslari/3.gif",
                                            height: 125.0,
                                            width: 125.0,
                                          ),
                                        ),
                                      const  Expanded(
                                          child: Text(
                                            "Leg press",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Expanded(
                                          child: seviyeSet(),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      height: 2,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            "lib/assets/gif/bacakKaslari/4.gif",
                                            height: 125.0,
                                            width: 125.0,
                                          ),
                                        ),
                                       const Expanded(
                                          child: Text(
                                            "Lying leg curl",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Expanded(
                                          child: seviyeSet(),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
            )
          ],
        ),
      ),
    );
  }

//setin Seviyesi için yazdım
  Text seviyeSet() {
    return kullanici_1.sayi == 1
        ? const Text(
            "3x10",
            style: TextStyle(color: Colors.black, fontSize: 14),
            textDirection: TextDirection.rtl,
          )
        : kullanici_1.sayi == 2
            ? const Text(
                "4x10",
                style: TextStyle(color: Colors.black, fontSize: 14),
                textDirection: TextDirection.rtl,
              )
            : const Text(
                "5x10",
                style: TextStyle(color: Colors.black, fontSize: 14),
                textDirection: TextDirection.rtl,
              );
  }
}
