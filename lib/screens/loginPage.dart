import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/auth.dart';
import 'package:fitness/screens/homePage.dart';
import 'package:fitness/screens/singinPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String sayfaName = "/LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  TextEditingController mail = TextEditingController();
  TextEditingController sifre = TextEditingController();

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(95, 0, 108, 1).withOpacity(0.5),
                      BlendMode.srcOver),
                  image: AssetImage("lib/assets/images/girisResim.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "GİRİŞ YAP",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        child: TextFormField(
                            controller: mail,
                            decoration: InputDecoration(labelText: "E-Mail"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                      .hasMatch(value)) {
                                return "email hasabınızı yanlış";
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
                            decoration: InputDecoration(labelText: "Şifre"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "şifre alanını doldurunuz";
                              } else {
                                return null;
                              }
                            }),
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
                              FocusScope.of(context)
                                  .unfocus(); //diğer ekrana geçiş yaparken klavye açık hatası

                              _authService
                                  .signIn(mail.text.trim(), sifre.text.trim())
                                  .then((value) =>
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          HomePage1.sayfaName,
                                          (route) => false))
                                  .onError((error, stackTrace) =>
                                      _girisBasarisizDialog(
                                          context)); //on error deneyerek buldum :))
                            },
                            child: Text(
                              "GİRİŞ YAP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                            width: 300,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, SinginPage.sayfaName);
                              },
                              child: const Text(
                                "HESABINIZ YOK MU ?",
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

_girisBasarisizDialog(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    borderSide: BorderSide(color: Colors.green, width: 2),
    width: 280,
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.BOTTOMSLIDE,
    title: 'ŞİFRE VEYA E-MAİL YANLIŞ',
    desc: "Mail ve şifrenizi tekrar deneyiniz!",
    showCloseIcon: true,
    btnOkOnPress: () {},
  )..show();
}
