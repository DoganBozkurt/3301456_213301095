import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/screens/homePage.dart';
import 'package:fitness/screens/notificationPage.dart';
import 'package:fitness/egitimPlan/hareket1.dart';
import 'package:fitness/screens/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:fitness/screens/singinPage.dart';
import 'package:fitness/screens/loginPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  static const String sayfaName = "/";
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebasBaslatma =
        Firebase.initializeApp(); //öcelikle firebaseyi başlatık
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto',),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.sayfaName:
            return MaterialPageRoute(builder: (context) => HomePage());
          case SinginPage.sayfaName:
            return MaterialPageRoute(builder: (context) => SinginPage());
          case LoginPage.sayfaName:
            return MaterialPageRoute(builder: (context) => LoginPage());
          case HomePage1.sayfaName:
            return MaterialPageRoute(builder: (context) => HomePage1());
          case ProfilePage.sayfaName:
            return MaterialPageRoute(builder: (context) => ProfilePage());
          case NotificationsPage.sayfaName:
            return MaterialPageRoute(builder: (context) => NotificationsPage());
          case Hareket1.sayfaName:
            return MaterialPageRoute(
                builder: (context) =>
                    Hareket1(settings.arguments as Kullanici));
            
          default:
            null;
        }
      },
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _firebasBaslatma,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //yanıt geldi ama hatalı ise
              return const Center(
                child: Text("beklenmeyen bir hata oluştu"),
              );
            } else if (snapshot.hasData) {
              return Scaffold(
                body: BaslangicEkrani(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

//Burda ayırdım Body kısmı
class BaslangicEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/images/spor.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Stack(
          children: [
            arkaplanRenk, //renk Kısmı Aşağıda
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 370,
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "HOŞGELDİNİZ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Başlamak için lütfen giriş yapınız veya kayıt olunuz!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(123, 39, 163, 1),
                              shadowColor: const Color.fromRGBO(200, 47, 129, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginPage.sayfaName);
                            },
                            child: const Text(
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
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 300,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, SinginPage.sayfaName);
                              },
                              child: const Text(
                                "KAYIT OL",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(194, 46, 131, 1),
                                shadowColor: const Color.fromRGBO(128, 39, 161, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget arkaplanRenk = Container(
    decoration: const BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(19, 20, 41, 0.50),
        Color.fromRGBO(19, 20, 41, 1),
        Color.fromRGBO(19, 20, 41, 1)
      ]),
));
