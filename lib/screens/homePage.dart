//import 'package:awesome_dialog/awesome_dialog.dart'; silme lazım olacak giriş sayfası için
import 'package:fitness/constants.dart';
import 'package:fitness/egitimPlan/hareket1.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage1 extends StatefulWidget {
  static const String sayfaName = "/HomePage1";

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class Kullanici {
  String secilenButton;
  String secilenCalisma;
  int sayi;
  Kullanici(
      {this.secilenButton = "defualt",
      this.secilenCalisma = "default",
      this.sayi = 5});
}

class _HomePage1State extends State<HomePage1> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(19, 20, 41, 1),
                    Color.fromRGBO(19, 20, 41, 1),
                  ]),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(19, 20, 41, 1),
                      Color.fromRGBO(19, 20, 41, 1),
                    ]),
                  ),
                  child: DatePicker(
                    DateTime.now(),
                    locale: "Tr",
                    width: 60,
                    height: 80,
                    controller: _controller,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Color.fromRGBO(123, 39, 163, 1),
                    selectedTextColor: Colors.white,
                    deactivatedColor: Colors.white,
                    dayTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    monthTextStyle:
                        TextStyle(color: Colors.white, fontSize: 12),
                    dateTextStyle: TextStyle(color: Colors.white, fontSize: 24),
                    inactiveDates: [
                      DateTime.now().add(Duration(days: 3)),
                      DateTime.now().add(Duration(days: 4)),
                      DateTime.now().add(Duration(days: 7))
                    ],
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedValue = date;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(19, 20, 41, 1),
                      Color.fromRGBO(19, 20, 41, 1),
                    ]),
                  ),
                  child: Text("EGZERSİZ PLANLARI",
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(19, 20, 41, 1),
                          Color.fromRGBO(19, 20, 41, 1),
                        ]),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Acemi"),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(123, 39, 163, 1),
                              shadowColor: Color.fromRGBO(200, 47, 129, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.3,
                      ),
                      Expanded(
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Orta seviye"),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(123, 39, 163, 1),
                              shadowColor: Color.fromRGBO(200, 47, 129, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.3,
                      ),
                      Expanded(
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("İleri"),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(123, 39, 163, 1),
                              shadowColor: Color.fromRGBO(200, 47, 129, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Spor Hareketleri

                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Container(
                    height: 580,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //GOGUS KAS HAREKETİ
                          Container(
                            margin: EdgeInsets.only(
                                top: 3.50, right: 1.5, left: 1.5),
                            width: double.infinity,
                            height: 165,
                            child: FocusedMenuHolder(
                              blurSize: 150,
                              menuItems: [
                                FocusedMenuItem(
                                    title: Text('Başlangıç seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.heartBroken,
                                        size: 35),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "GÖĞÜS HAREKETLERİ BAŞLANGIÇ",
                                              secilenCalisma: "gogusHareketi",
                                              sayi: 1));
                                    }),
                                FocusedMenuItem(
                                    title: Text('Orta seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.heartbeat,
                                        size: 35),
                                    onPressed: () => {
                                          Navigator.pushNamed(
                                              context, Hareket1.sayfaName,
                                              arguments: Kullanici(
                                                  secilenButton:
                                                      "GÖĞÜS HAREKETLERİ ORTA",
                                                  secilenCalisma:
                                                      "gogusHareketi",
                                                  sayi: 2)),
                                        }),
                                FocusedMenuItem(
                                    title: Text('İleri seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 35),
                                    onPressed: () => {
                                          Navigator.pushNamed(
                                              context, Hareket1.sayfaName,
                                              arguments: Kullanici(
                                                  secilenButton:
                                                      "GÖĞÜS HAREKETLERİ İLERİ",
                                                  secilenCalisma:
                                                      "gogusHareketi",
                                                  sayi: 3)),
                                        }),
                                FocusedMenuItem(
                                    title: Text('İPTAL',
                                        style: TextStyle(color: Colors.white)),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.powerOff,
                                        color: Colors.white,
                                        size: 35),
                                    backgroundColor: Colors.green,
                                    onPressed: () {}),
                              ],
                              blurBackgroundColor: Colors.blueGrey[900],
                              menuOffset: 20,
                              openWithTap: true,
                              duration: Duration(seconds: 0),
                              animateMenuItems: false,
                              onPressed: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  //Container burdan başlıyor
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Color.fromRGBO(123, 39, 163, 1)
                                                .withOpacity(0.4),
                                            BlendMode.srcOver),
                                        image: AssetImage(
                                            "lib/assets/images/gogusKaslari.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        child: Text(
                                          "GÖĞÜS \n KASLARI",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //KOL KASLARI
                          Container(
                            margin: EdgeInsets.only(
                                top: 3.50, right: 1.5, left: 1.5),
                            width: double.infinity,
                            height: 165,
                            child: FocusedMenuHolder(
                              blurSize: 150,
                              menuItems: [
                                FocusedMenuItem(
                                    title: Text('Başlangıç seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.heartBroken,
                                        size: 35),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "KOL HAREKETLERİ BAŞLANGIÇ",
                                              secilenCalisma: "kolHareketi",
                                              sayi: 1));
                                    }),
                                FocusedMenuItem(
                                    title: Text('Orta seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.heartbeat,
                                        size: 35),
                                    onPressed: () => {
                                      Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "KOL HAREKETLERİ ORTA",
                                              secilenCalisma: "kolHareketi",
                                              sayi: 2)),
                                    }),
                                FocusedMenuItem(
                                    title: Text('İleri seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 35),
                                    onPressed: () => {
                                       Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "KOL HAREKETLERİ İLERİ",
                                              secilenCalisma: "kolHareketi",
                                              sayi: 3)),
                                    }),
                                FocusedMenuItem(
                                    title: Text('İPTAL',
                                        style: TextStyle(color: Colors.white)),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.powerOff,
                                        color: Colors.white,
                                        size: 35),
                                    backgroundColor: Colors.green,
                                    onPressed: () {}),
                              ],
                              blurBackgroundColor: Colors.blueGrey[900],
                              menuOffset: 20,
                              openWithTap: true,
                              duration: Duration(seconds: 0),
                              animateMenuItems: false,
                              onPressed: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  //Container burdan başlıyor
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Color.fromRGBO(123, 39, 163, 1)
                                                .withOpacity(0.4),
                                            BlendMode.srcOver),
                                        image: AssetImage(
                                            "lib/assets/images/kolKaslari.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        child: Text(
                                          "KOL \n KASLARI",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          //SIRT KASLARI
                          Container(
                            margin: EdgeInsets.only(
                                top: 3.50, right: 1.5, left: 1.5),
                            width: double.infinity,
                            height: 165,
                            child: FocusedMenuHolder(
                              blurSize: 150,
                              menuItems: [
                                FocusedMenuItem(
                                    title: Text('Başlangıç seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.heartBroken,
                                        size: 35),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "SIRT HAREKETLERİ BAŞLANGIÇ",
                                              secilenCalisma: "sirtHareketi",
                                              sayi: 1));
                                    }),
                                FocusedMenuItem(
                                    title: Text('Orta seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.heartbeat,
                                        size: 35),
                                    onPressed: () => {
                                      Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "SIRT HAREKETLERİ ORTA",
                                              secilenCalisma: "sirtHareketi",
                                              sayi: 2))
                                    }),
                                FocusedMenuItem(
                                    title: Text('İleri seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 35),
                                    onPressed: () => {Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "SIRT HAREKETLERİ İLERİ",
                                              secilenCalisma: "sirtHareketi",
                                              sayi: 3))}),
                                FocusedMenuItem(
                                    title: Text('İPTAL',
                                        style: TextStyle(color: Colors.white)),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.powerOff,
                                        color: Colors.white,
                                        size: 35),
                                    backgroundColor: Colors.green,
                                    onPressed: () {}),
                              ],
                              blurBackgroundColor: Colors.blueGrey[900],
                              menuOffset: 20,
                              openWithTap: true,
                              duration: Duration(seconds: 0),
                              animateMenuItems: false,
                              onPressed: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  //Container burdan başlıyor
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Color.fromRGBO(123, 39, 163, 1)
                                                .withOpacity(0.4),
                                            BlendMode.srcOver),
                                        image: AssetImage(
                                            "lib/assets/images/sirtKaslari.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        child: Text(
                                          "SIRT \n KASLARI",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          //KARIN KASLARI
                          Container(
                            margin: EdgeInsets.only(
                                top: 3.50, right: 1.5, left: 1.5),
                            width: double.infinity,
                            height: 165,
                            child: FocusedMenuHolder(
                              blurSize: 150,
                              menuItems: [
                                FocusedMenuItem(
                                    title: Text('Başlangıç seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.heartBroken,
                                        size: 35),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "KARIN KAS. HAREKETLERİ BAŞLANGIÇ",
                                              secilenCalisma: "karinHareketi",
                                              sayi: 1));
                                    }),
                                FocusedMenuItem(
                                    title: Text('Orta seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.heartbeat,
                                        size: 35),
                                    onPressed: () => {
                                      Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "KARIN KAS. HAREKETLERİ ORTA",
                                              secilenCalisma: "karinHareketi",
                                              sayi: 2))
                                    }),
                                FocusedMenuItem(
                                    title: Text('İleri seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 35),
                                    onPressed: () => {
                                      Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "KARIN KAS. HAREKETLERİ İLERİ",
                                              secilenCalisma: "karinHareketi",
                                              sayi: 3))
                                    }),
                                FocusedMenuItem(
                                    title: Text('İPTAL',
                                        style: TextStyle(color: Colors.white)),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.powerOff,
                                        color: Colors.white,
                                        size: 35),
                                    backgroundColor: Colors.green,
                                    onPressed: () {}),
                              ],
                              blurBackgroundColor: Colors.blueGrey[900],
                              menuOffset: 20,
                              openWithTap: true,
                              duration: Duration(seconds: 0),
                              animateMenuItems: false,
                              onPressed: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  //Container burdan başlıyor
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Color.fromRGBO(123, 39, 163, 1)
                                                .withOpacity(0.4),
                                            BlendMode.srcOver),
                                        image: AssetImage(
                                            "lib/assets/images/karinKaslari.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        child: Text(
                                          "KARIN \n KASLARI",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 1,
                          ),
                          //BACAK KASLARI
                          Container(
                            margin: EdgeInsets.only(
                                top: 3.50, right: 1.5, left: 1.5),
                            width: double.infinity,
                            height: 165,
                            child: FocusedMenuHolder(
                              blurSize: 150,
                              menuItems: [
                                FocusedMenuItem(
                                    title: Text('Başlangıç seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.heartBroken,
                                        size: 35),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "BACAK KAS. HAREKETLERİ BAŞLANGIÇ",
                                              secilenCalisma: "bacakHareketi",
                                              sayi: 1));
                                    }),
                                FocusedMenuItem(
                                    title: Text('Orta seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.heartbeat,
                                        size: 35),
                                    onPressed: () => {
                                      Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "BACAK KAS. HAREKETLERİ ORTA",
                                              secilenCalisma: "bacakHareketi",
                                              sayi: 2))
                                    }),
                                FocusedMenuItem(
                                    title: Text('İleri seviye'),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 35),
                                    onPressed: () => {Navigator.pushNamed(
                                          context, Hareket1.sayfaName,
                                          arguments: Kullanici(
                                              secilenButton:
                                                  "BACAK KAS. HAREKETLERİ İLERİ",
                                              secilenCalisma: "bacakHareketi",
                                              sayi: 3))}),
                                FocusedMenuItem(
                                    title: Text('İPTAL',
                                        style: TextStyle(color: Colors.white)),
                                    trailingIcon: Icon(
                                        FontAwesomeIcons.powerOff,
                                        color: Colors.white,
                                        size: 35),
                                    backgroundColor: Colors.green,
                                    onPressed: () {}),
                              ],
                              blurBackgroundColor: Colors.blueGrey[900],
                              menuOffset: 20,
                              openWithTap: true,
                              duration: Duration(seconds: 0),
                              animateMenuItems: false,
                              onPressed: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  //Container burdan başlıyor
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Color.fromRGBO(123, 39, 163, 1)
                                                .withOpacity(0.4),
                                            BlendMode.srcOver),
                                        image: AssetImage(
                                            "lib/assets/images/bacakKaslari.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        child: Text(
                                          "BACAK \n KASLARI",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
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
                //
                //alt menu constants bölümünde
              ],
            ),
          ),
          bottomNavigationBar: AltMenu()),
    );
  }
}
