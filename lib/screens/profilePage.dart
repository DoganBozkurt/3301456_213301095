import 'dart:ui';

import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  static const String sayfaName = "/ProfilePage";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int secilenBoy = 184;
  int secilenKilo = 76;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: AltMenu(),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                Color.fromRGBO(19, 20, 41, 1),
                Color.fromRGBO(19, 20, 41, 1),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //profil

              Expanded(
                flex: 3,
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
                    Container(
                      child: Text("Adı Soyadı"),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.5,
              ),
              //kilo boy
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(95, 0, 108, 1),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                FontAwesomeIcons.mars,
                                color: Colors.white,
                                size: 35,
                              ),
                              Text("KADIN",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
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
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                FontAwesomeIcons.venus,
                                color: Colors.white,
                                size: 35,
                              ),
                              Text(
                                "ERKEK",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
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
                            SizedBox(height: 1.5,),
                            Icon(
                              FontAwesomeIcons.weight,
                              color: Colors.white,
                              size: 35,
                            ),
                            SizedBox(height: 1.5,),
                            Text("KİLONUZ: $secilenKilo",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          
                          ],
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
                            SizedBox(height: 1.5,),
                            Icon(
                              FontAwesomeIcons.restroom,
                              color: Colors.white,
                              size: 35,
                            ),
                            SizedBox(height: 1.5,),
                            Text("BOYUNUZ: $secilenBoy",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                           
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text("BAŞARILARIN",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              //hedef Kilo
              Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 6.0, right: 6.0),
                        height: 100,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: [
                              Color.fromRGBO(95, 0, 108, 1),
                              Color.fromRGBO(132, 40, 223, 1),
                            ])),
                      ),
                      Positioned(
                        top: 3.0,
                        left: 58.0,
                        child: Text(
                          "Hedef Kilo",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Positioned(
                        bottom: 1.0,
                        left: 50.0,
                        child: Image.asset(
                          "lib/assets/images/Dumbbell1.jpg",
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Positioned(
                        top: 45.0,
                        left: 140.0,
                        child: Text(
                          "76",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      Positioned(
                        top: 52.0,
                        left: 175.0,
                        child: Text(
                          "KG",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      Positioned(
                        top: 0.01,
                        bottom: 0.01,
                        right: 0.0000000000000000001,
                        child: Image.asset(
                          "lib/assets/images/basarilarResim.jpg",
                          width: 180,
                          height: 180,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 3.5,
              ),


              //aylık eğitim
              Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 6.0, right: 6.0),
                        height: 100,
                        color: Color.fromRGBO(95, 0, 108, 1),
                      ),
                      Positioned(
                        top: 33.0,
                        left: 58.0,
                        child: Text(
                          "Aylık Eğitim Planı",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Positioned(
                        top: 50.0,
                        left: 100.0,
                        child: Text(
                          "10",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      Positioned(
                        top: 60.0,
                        left: 130.0,
                        child: Text(
                          "/5",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      //Çizgiler
                      Positioned(
                          top: 38.0,
                          right: 100.0,
                          child: Container(
                            height: 12,
                            width: 50,
                            color: Colors.pink,
                          )),
                      Positioned(
                          top: 38.0,
                          right: 55.0,
                          child: Container(
                            height: 12,
                            width: 50,
                            color: Colors.blue,
                          )),
                    ],
                  )),

//Senin Programın
              Text("SENİN PORGRAMIN",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              Expanded(
                flex: 5,
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
                        Container(
                          margin:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          width: double.infinity,
                          height: 165,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color.fromRGBO(123, 39, 163, 1)
                                      .withOpacity(0.4),
                                  BlendMode.srcOver),
                              image: AssetImage("lib/assets/images/sirtKaslari.jpg"),
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
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          width: double.infinity,
                          height: 165,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color.fromRGBO(123, 39, 163, 1)
                                      .withOpacity(0.4),
                                  BlendMode.srcOver),
                              image: AssetImage("lib/assets/images/kolKaslari.jpg"),
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
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          width: double.infinity,
                          height: 165,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color.fromRGBO(123, 39, 163, 1)
                                      .withOpacity(0.4),
                                  BlendMode.srcOver),
                              image: AssetImage("lib/assets/images/bacakKaslari.jpg"),
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
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
