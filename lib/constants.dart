import 'package:fitness/screens/raporlarPage.dart';
import 'package:fitness/screens/fitnessCalcuterPage.dart';
import 'package:fitness/screens/homePage.dart';
import 'package:fitness/screens/notificationPage.dart';
import 'package:fitness/screens/profilePage.dart';
import 'package:flutter/material.dart';
//TextStyle
TextStyle metinTextStyle= TextStyle(color: const Color(0xffffffff),fontSize: 15);
TextStyle beyazTextStyle= TextStyle(color: const Color(0xffffffff));
//Alt menü
class AltMenu extends StatelessWidget {
  const AltMenu({Key? key}) : super(key: key);

  final anaRenk = const Color(0xff4338CA);
  final arkaplanRenk = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(19, 20, 41, 0.95), //menu rengi
      child: SizedBox(
        height: 75,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                  text: "Raporlar",
                  icon: Icons.feed,
                  selected: false,
                  onPressed: () {
                    Navigator.pushNamed(context, Raporlar.sayfaName);
                  }),
              IconBottomBar(
                  text: "Hesaplayıcı",
                  icon: Icons.calculate,
                  selected: false,
                  onPressed: () {
                    Navigator.pushNamed(context, CalcuterPage.sayfaName);
                  }),
              IconAltmenu(
                  text: "Anasayfa",
                  icon: Icons.home,
                  selected: false,
                  onPressed: () {
                    Navigator.pushNamed(context, HomePage1.sayfaName);
                  }),
              IconBottomBar(
                  text: "Bildirim",
                  icon: Icons.notifications_on,
                  selected: false,
                  onPressed: () {
                    Navigator.pushNamed(context, NotificationsPage.sayfaName);
                  }),
              IconBottomBar(
                  text: "Arama",
                  icon: Icons.person,
                  selected: false,
                  onPressed: () {
                    Navigator.pushNamed(context, ProfilePage.sayfaName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final anaRenk = const Color(0xff4338CA);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 40,
            color: selected ? anaRenk : Colors.white,
          ),
        ),
      ],
    );
  }
}

class IconAltmenu extends StatelessWidget {
  const IconAltmenu(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final anaRenk = const Color(0xff4338CA);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: anaRenk,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}

