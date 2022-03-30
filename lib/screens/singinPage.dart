import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SinginPage extends StatefulWidget {
  static const String sayfaName = "/SinginPage";

  @override
  State<SinginPage> createState() => _SinginPageState();
}

final formKey = GlobalKey<FormState>();
String secilenCinsiyet = "belirtilmemiş";
int secilenBoy = 180;
int secilenKilo = 75;

class _SinginPageState extends State<SinginPage> {
  TextEditingController adi = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController sifre = TextEditingController();
  TextEditingController sifreTekrar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 4,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Color.fromRGBO(95, 0, 108, 1).withOpacity(0.8),
                        BlendMode.srcOver),
                    image: AssetImage("lib/assets/images/spor.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "KAYIT OL",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 11,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("lib/assets/images/avatar.jpg"),
                          ),
                          Positioned(
                              bottom: 20.0,
                              right: 10.0,
                              child: InkWell(
                                  child: Icon(Icons.camera_alt,
                                      size: 28.0,
                                      color: Color.fromRGBO(95, 0, 108, 1))))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        child: TextFormField(
                            controller: adi,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.user,
                                  color: Color.fromRGBO(95, 0, 108, 1),
                                ),
                                labelText: "Adınız ve Soyadınız"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "lütfen isimizi doğru şekilde giriniz";
                              } else {
                                return null;
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        child: TextFormField(
                            controller: mail,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.envelope,
                                  color: Color.fromRGBO(95, 0, 108, 1),
                                ),
                                labelText: "E-Mail"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                      .hasMatch(value)) {
                                return "e-mail hasabınızı yanlış";
                              } else {
                                return null;
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        child: TextFormField(
                            controller: sifre,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.key,
                                  color: Color.fromRGBO(95, 0, 108, 1),
                                ),
                                labelText: "Şifre"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "şifre alanını doldurunuz";
                              } else {
                                return null;
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        child: TextFormField(
                            controller: sifreTekrar,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.key,
                                  color: Color.fromRGBO(95, 0, 108, 1),
                                ),
                                labelText: "Şifrenizi Tekrar Giriniz"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  sifreTekrar.text != sifre.text) {
                                return "Kullandığınız şifreler aynı değil!";
                              } else {
                                return null;
                              }
                            }),
                      ),
//boy kilo ve cinsiyet bilgisi
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  secilenCinsiyet = "kadın";
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 8.0),
                                decoration: BoxDecoration(
                                  color: secilenCinsiyet == "kadın"
                                      ? Colors.black54
                                      : Color.fromRGBO(95, 0, 108, 1),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.mars,
                                      color: Colors.white,
                                      size: 65,
                                    ),
                                    Text("KADIN",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.5,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  secilenCinsiyet = "erkek";
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: secilenCinsiyet == "erkek"
                                      ? Colors.black54
                                      : Color.fromRGBO(95, 0, 108, 1),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.venus,
                                      color: Colors.white,
                                      size: 65,
                                    ),
                                    Text(
                                      "ERKEK",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.5,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(95, 0, 108, 1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.weight,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  Text("KİLONUZ: $secilenKilo",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 3, left: 3),
                                          child: ButtonTheme(
                                            child: OutlineButton(
                                              onPressed: () {
                                                setState(() {
                                                  secilenKilo++;
                                                });
                                              },
                                              child: Icon(
                                                FontAwesomeIcons.plus,
                                                color: Colors.white,
                                              ),
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 3, left: 3),
                                          child: ButtonTheme(
                                            child: OutlineButton(
                                              onPressed: () {
                                                setState(() {
                                                  secilenKilo--;
                                                });
                                              },
                                              child: Icon(
                                                FontAwesomeIcons.minus,
                                                color: Colors.white,
                                              ),
                                              borderSide: BorderSide(
                                                  color: Colors.white),
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
                          SizedBox(
                            width: 2.5,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(95, 0, 108, 1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.restroom,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  Text("BOYUNUZ: $secilenBoy",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 3, left: 3),
                                          child: ButtonTheme(
                                            child: OutlineButton(
                                              onPressed: () {
                                                setState(() {
                                                  secilenBoy++;
                                                });
                                              },
                                              child: Icon(
                                                FontAwesomeIcons.plus,
                                                color: Colors.white,
                                              ),
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 3, left: 3),
                                          child: ButtonTheme(
                                            child: OutlineButton(
                                              onPressed: () {
                                                setState(() {
                                                  secilenBoy--;
                                                });
                                              },
                                              child: Icon(
                                                FontAwesomeIcons.minus,
                                                color: Colors.white,
                                              ),
                                              borderSide: BorderSide(
                                                  color: Colors.white),
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
                      ),

                      //buttonlar
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                            width: 300,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  _kayitBasariliDialog(context);
                                  final snackBar =
                                      SnackBar(content: Text("submit"));
                                  Map<String, dynamic> kullaniciData = {
                                    "adiVeSoyadi": adi.text,
                                    "e-Mail": mail.text,
                                    "sifre": sifre.text,
                                    "cinsiyet": secilenCinsiyet,
                                    "kilo": secilenKilo,
                                    "boy": secilenBoy,
                                  };
                                  print(sifreTekrar.text);
                                  FirebaseFirestore firestore =
                                      FirebaseFirestore.instance;
                                  CollectionReference usersCollectionRef =
                                      firestore.collection("usersCollection");
                                  usersCollectionRef
                                      .doc(mail.text)
                                      .set(kullaniciData);
                                } else {
                                  _kayitBasarisizDialog(context);
                                }
                              },
                              child: const Text(
                                "KAYIT OL",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(194, 46, 131, 1),
                                shadowColor: Color.fromRGBO(128, 39, 161, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(123, 39, 163, 1),
                              shadowColor: Color.fromRGBO(200, 47, 129, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, LoginPage.sayfaName);
                            },
                            child: Text(
                              "HESABIN ZATEN VAR MI?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

_kayitBasariliDialog(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    borderSide: BorderSide(color: Colors.green, width: 2),
    width: 280,
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.BOTTOMSLIDE,
    title: 'KAYIT BAŞARILI',
    desc: 'Lütfen giriş sayfasından giriş yapınız...',
    showCloseIcon: true,
    btnOkOnPress: () {
      Navigator.pushReplacementNamed(context, LoginPage.sayfaName);
    },
  )..show();
}

_kayitBasarisizDialog(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    borderSide: BorderSide(color: Colors.green, width: 2),
    width: 280,
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.BOTTOMSLIDE,
    title: 'KAYIT BAŞARISIZ',
    desc: 'Lütfen girmiş olduğunuz bilgileri teyit ediniz...',
    showCloseIcon: true,
    btnOkOnPress: () {},
  )..show();
}
