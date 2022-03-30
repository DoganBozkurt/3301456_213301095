import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  static const String sayfaName = "/NotificationsPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BİLDİRİMLER"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color.fromRGBO(19, 20, 41, 0.95),
                Color.fromRGBO(19, 20, 41, 1),
              ])),
        ),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: liste(),
      ),
      bottomNavigationBar: AltMenu(),
    );
  }

  liste() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return listeEkle(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 3,
            color: Color.fromRGBO(19, 20, 41, 0.95),
          );
        },
        itemCount: 20);
  }

  Widget listeEkle(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 13.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BildirimIcon(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mesaj(index),
                  tahirBildirim(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget BildirimIcon() {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(19, 20, 41, 1),
      ),
      child: Icon(
        Icons.notifications,
        size: 25,
        color: Colors.white,
      ),
    );
  }

  Widget mesaj(int index) {
    double textBoyut = 14;
    return Container(
      child: RichText(
        maxLines: 12,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: "ADMİN",
            style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(19, 20, 41, 1),
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: ":",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ))
            ]),
      ),
    );
  }

  Widget tahirBildirim(int inex) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Merhaba\nBu bir denemedir",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          Text(
            "11-03-2022",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
